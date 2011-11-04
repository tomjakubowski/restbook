require 'rubygems'
require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../dummy/config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  require 'capybara/rspec'
  require 'factory_girl'

  ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f}

  # Per http://stackoverflow.com/questions/5200654/how-do-i-write-a-rails-3-1-engine-controller-test-in-rspec/7656653#7656653
  module ControllerHacks
    def get(action, parameters = nil, session = nil, flash = nil)
      process_action(action, parameters, session, flash, "GET")
    end

    # Executes a request simulating POST HTTP method and set/volley the response
    def post(action, parameters = nil, session = nil, flash = nil)
      process_action(action, parameters, session, flash, "POST")
    end

    # Executes a request simulating PUT HTTP method and set/volley the response
    def put(action, parameters = nil, session = nil, flash = nil)
      process_action(action, parameters, session, flash, "PUT")
    end

    # Executes a request simulating DELETE HTTP method and set/volley the response
    def delete(action, parameters = nil, session = nil, flash = nil)
      process_action(action, parameters, session, flash, "DELETE")
    end

    private

    def process_action(action, parameters = nil, session = nil, flash = nil, method = "GET")
      parameters ||= {}
      process(action, parameters.merge!(:use_route => :restbook), session, flash, method)
    end
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
  FactoryGirl.find_definitions

  # I like to get new url helpers without restarting spork.
  RSpec.configure do |config|
    config.mock_with :rspec
    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = false

    config.include Restbook::Engine.routes.url_helpers
    config.include ControllerHacks, :type => :controller
  end

  # Hack to force Spork to reload engine models + controllers.
  Dir[File.join(ENGINE_RAILS_ROOT, "app/models/restbook/*.rb")].each { |f| load f }
  Dir[File.join(ENGINE_RAILS_ROOT, "app/controllers/restbook/*.rb")].each { |f| load f }
end