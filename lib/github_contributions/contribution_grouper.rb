module GithubContributions
  module ContributionGrouper
    class << self
      # @param events [Event]
      # @return Hash<GithubObject, [Event]>
      def by_issue_or_pull_request(events)
        grouped_events = {}

        events.each do |event|
          if event.respond_to?(:pull_request)
            grouped_events[event.pull_request] = [] unless grouped_events.key?(event.pull_request)
            grouped_events[event.pull_request] << event
          end
          if event.respond_to?(:issue)
            grouped_events[event.issue] = [] unless grouped_events.key?(event.issue)
            grouped_events[event.issue] << event
          end
        end

        grouped_events
      end
    end
  end
end
