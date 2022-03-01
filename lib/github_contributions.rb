require "active_support/all"
require "chronic"
require "ostruct"
require "optparse"
require "octokit"
require "hashie"
require "digest"

Dir.glob(File.dirname(__FILE__) + '/github_contributions/**/*.rb').sort.each { |file| require file }

module GithubContributions
  class << self
    def run(args)
      options = OptionHandler.parse_options(args)

      puts "Searching between #{options.start_date.to_formatted_s(:long_ordinal)} and #{options.end_date.to_formatted_s(:long_ordinal)}..."

      client = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
      client.auto_paginate = true

      results = client.user_events(options.author)

      contribution_count = results.size
      filtered_contribution_count = 0
      events = results.map do |result|
        result.include(Hashie::Mash)

        begin
          event = "GithubContributions::Events::#{result.type}".constantize.new(result)
        rescue
          # TODO: I'd want this one, just don't have an example of it yet
          # binding.pry if result.type == "CommitCommentEvent"
          next
        end

        next unless event.created_at.between?(options.start_date, options.end_date)

        if options.org
          next unless event.org == options.org
        end

        filtered_contribution_count += 1
        event
      end.compact.reverse

      puts "Found #{filtered_contribution_count}/#{contribution_count} contributions using search filters"
      puts ""

      grouped_events = ContributionGrouper.by_issue_or_pull_request(events)
      MarkdownPresenter.output(grouped_events)
    end
  end
end
