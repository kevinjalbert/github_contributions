module GithubContributions
  module GithubObjects
    class User < GithubObject
      def initialize(data)
        super(data)
        @data[:html_url] = "https://github.com/#{data.login}" if @data.html_url.nil?
      end
    end
  end
end
