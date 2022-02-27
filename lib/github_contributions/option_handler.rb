module GithubContributions
  module OptionHandler
    def self.parse_options(args)
      options = OpenStruct.new(
        author: nil,
        org: nil,
        start_date: Time.current.at_beginning_of_day,
        end_date: Time.current.at_end_of_day
      )

      OptionParser.new do |opts|
        opts.banner = <<~TEXT
          Usage: github_contributions [options]
          You need a GitHub Personal Access Token in your ENVs as GITHUB_ACCESS_TOKEN for this to work.
          Dates are specified using natual language (via chronic gem).
          The GitHub's Events API only returns the last 300 events, and the filtering is client-side.
        TEXT
        opts.version = VERSION
        opts.on "-a", "--author STRING", String, "The author of the contributions" do |value|
          options.author = value
        end
        opts.on "-o", "--org STRING", String, "Filter contributions by the organization they belong in (optional)" do |value|
          options.org = value
        end
        opts.on "-s", "--start_date STRING", String, "Filter contributions to be after the beginning of the specified day (defaults to today)" do |value|
          options.start_date = Chronic.parse(value)&.at_beginning_of_day
        end
        opts.on "-e", "--end_date STRING", String, "Filter contributions to be before the end of the specified day (defaults to today)" do |value|
          options.end_date = Chronic.parse(value)&.at_end_of_day
        end
      end.parse!

      raise(TimeParseError, "The end date could not be properly parsed") if options.end_date.nil?
      raise(TimeParseError, "The start date could not be properly parsed") if options.start_date.nil?
      raise(StartDateOutOfRange, "The start date must be within 90 day from today") unless options.start_date.between?(90.days.ago, Time.current.at_end_of_day)
      raise(MissingAuthor, "No author was supplied in arguments (use -a <author>)") if options.author.blank?
      raise(MissingGithubAcessToken, "GitHub Personal Access Token was not found (should be an ENV as GITHUB_ACCESS_TOKEN") if ENV["GITHUB_ACCESS_TOKEN"].nil?

      options
    rescue GithubContributions::Exception => e
      puts e.message
      exit
    end
  end
end
