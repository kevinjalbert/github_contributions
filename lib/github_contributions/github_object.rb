module GithubContributions
  # call these payloads?
  class GithubObject
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def user
      GithubObjects::User.new(data.user)
    end

    # ContributionGrouper uses these objects as keys in a hash
    # We need to define the `hash` and `eql?` so they work correctly
    def eql?(other)
      hash == other.hash
    end

    def hash
      data.html_url.hash
    end
  end
end
