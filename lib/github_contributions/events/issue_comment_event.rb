module GithubContributions
  module Events
    class IssueCommentEvent < Event
      def payload
        comment
      end

      def comment
        @comment ||= GithubObjects::Comment.new(data.payload.comment)
      end

      # Note a pull request comment is classifed as an 'issue' although there is
      # a `pull_request` attribute in the payload that could be used to id one
      def issue
        @issue ||= GithubObjects::Issue.new(data.payload.issue)
      end
    end
  end
end
