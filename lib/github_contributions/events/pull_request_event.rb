module GithubContributions
  module Events
    class PullRequestEvent < Event
      def payload
        pull_request
      end

      def pull_request
        @pull_request ||= GithubObjects::PullRequest.new(data.payload.pull_request)
      end
    end
  end
end
