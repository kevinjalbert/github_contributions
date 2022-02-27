module GithubContributions
  class Event
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def payload
    end

    def org
      data.org&.login
    end

    def actor
      GithubObjects::User.new(data.actor)
    end

    def created_at
      data.created_at
    end

    def action
      data.payload.action.titleize
    end

    def name
      self.class.name.demodulize.sub("Event", "").singularize
    end
  end
end
