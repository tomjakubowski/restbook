$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "restbook/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "restbook"
  s.version     = Restbook::VERSION
  s.authors     = ["Tom Jakubowski"]
  s.email       = ["tom@crystae.net"]
  s.homepage    = "http://www.crystae.net/"
  s.summary     = "A RESTful guestbook engine for Rails."
  s.description = "A RESTful guestbook engine for Rails."

  # s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.files = `git ls-files`.split("\n")

  s.add_dependency "rails", "~> 3.1.1"
  s.add_dependency "haml"
  s.add_dependency "sass"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "haml-rails"
  s.add_development_dependency "sass-rails"
  s.add_development_dependency "sqlite3"

  # Test dependencies
  s.add_development_dependency "rspec-rails", "~> 2.7"
  s.add_development_dependency "capybara", "~> 1.1"
  s.add_development_dependency "spork", "~> 0.9.0.rc"
end
