module GithubContributions
  class Exception < StandardError; end
  class MissingAuthor < GithubContributions::Exception; end
  class MissingGithubAcessToken < GithubContributions::Exception; end
  class TimeParseError < GithubContributions::Exception; end
  class StartDateOutOfRange < GithubContributions::Exception; end
end
