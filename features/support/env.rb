ENV['RAILS_ENV'] = 'test'
require './config/environment'

require 'rspec'
require 'rspec/expectations'
require 'spinach/capybara'
require 'database_cleaner'

###############
#  JS Driver  #
###############
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, :js_errors => false, :timeout => 60)
end
Spinach.hooks.on_tag("javascript") do
  ::Capybara.current_driver = ::Capybara.javascript_driver
end
Capybara.default_wait_time = 60
Capybara.ignore_hidden_elements = false

######################
#  Database cleaner  #
######################
DatabaseCleaner.strategy = :truncation

Spinach.hooks.before_scenario do
  DatabaseCleaner.start
end

Spinach.hooks.after_scenario do
  DatabaseCleaner.clean
end

Spinach.config.save_and_open_page_on_failure = false

Spinach.hooks.before_run do
  RSpec::Mocks::setup self
  include FactoryGirl::Syntax::Methods
end
