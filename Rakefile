require 'bundler/gem_tasks'

desc <<~TEXT
Task to run the gem during developing.

This doesn't require the gem to be installed.

rake dev [options]
rake dev -a "kevinjalbert" -s "last week"
TEXT
task :dev do
  require "pry"
  require "./lib/github_contributions"

  GithubContributions.run(ARGV[1..-1])

  # Needed, or rake will try to continue and 'parse' tasks from the args
  exit
end
