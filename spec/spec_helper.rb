require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] == 'test'
require File.expand_path("../../config/environment",__ FILE__)
require 'rspec/rails'
require 'rspec/autorun'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}


RSpec.configure do |config|
  config.before do
    ActionMailer::Base.deliveries.clear
  end

  config.include EmailSpec::Helper
  config.include Devise::TestHelpers, :type => :controller

  config.fixture_path = "#{::Rails.root}/spec/fixures"
end
