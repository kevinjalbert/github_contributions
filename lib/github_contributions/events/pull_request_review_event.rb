module GithubContributions
  module Events
    class PullRequestReviewEvent < Event
      def payload
        review
      end

      def review
        @review ||= GithubObjects::Review.new(data.payload.review)
      end

      def pull_request
        @pull_request ||= GithubObjects::PullRequest.new(data.payload.pull_request)
      end
    end
  end
end
