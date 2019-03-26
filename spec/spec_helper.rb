ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require_relative './setup_test_database'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::Console])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end


  # require our Sinatra app file
  require File.join(File.dirname(__FILE__), '..', 'app.rb')

  require 'capybara'
  require 'capybara/rspec'
  require 'rspec'
  # require 'features/web_helpers.rb'

  # tell Capybara about our app class
  Capybara.app = BookmarkManager
end
