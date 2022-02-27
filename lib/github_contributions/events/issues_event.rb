module GithubContributions
  module Events
    class IssuesEvent < Event
      def payload
        issue
      end

      def issue
        @issue ||= GithubObjects::Issue.new(data.payload.issue)
      end
    end
  end
end
