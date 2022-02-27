# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "github_contributions/version"

Gem::Specification.new do |spec|
  spec.name          = "github_contributions"
  spec.version       = GithubContributions::VERSION
  spec.authors       = ["Kevin Jalbert"]
  spec.email         = ["kevin.j.jalbert@gmail.com"]
  spec.summary       = "Gem that provides can fetch your GitHub contributions and output them"
  spec.description   = "Gem that provides can fetch your GitHub contributions and output them"
  spec.homepage      = "https://github.com/kevinjalbert/github_contributions"
  spec.license       = "MIT"

  spec.files         = Dir["**/*"]
  spec.test_files    = Dir["{test,spec,features}/**/*"]
  spec.executables   = Dir["bin/*"].map { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", ">= 2.3"
  spec.add_dependency "chronic", ">= 0.10"
  spec.add_dependency "octokit", ">= 4.22"
  spec.add_dependency "hashie", ">= 5.0"
  spec.add_dependency "activesupport", ">= 7.0"

  spec.add_development_dependency "rake", ">= 13.0"

  spec.required_ruby_version = ">= 2.7"
end
