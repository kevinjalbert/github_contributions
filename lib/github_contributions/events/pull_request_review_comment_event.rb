module GithubContributions
  module Events
    class PullRequestReviewCommentEvent < Event
      def payload
        comment
      end

      def comment
        @comment ||= GithubObjects::Comment.new(data.payload.comment)
      end

      def pull_request
        @pull_request ||= GithubObjects::PullRequest.new(data.payload.pull_request)
      end
    end
  end
end
