module GithubContributions
  module MarkdownPresenter
    class << self
      # @param grouped_events Hash<GithubObject, [Event]>
      def output(grouped_events)
        puts title
        grouped_events.each_pair do |issue, events|
          puts issue_or_pull_request(issue)
          events.each do |event|
            puts event(event)
          end
        end
      end

      private

      def title
        "# GitHub Contributions"
      end

      def issue_or_pull_request(issue)
        "- [#{issue.data.title.strip}](#{issue.data.html_url}) by [#{issue.user.data.login}](#{issue.user.data.html_url})"
      end

      def event(event)
        "  - [#{event.name} #{event.action} at #{event.created_at}](#{event.payload.data.html_url})"
      end
    end
  end
end
