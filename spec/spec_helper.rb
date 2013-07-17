require 'simplecov'
  SimpleCov.start

if ENV['RAILS_ENV'] == 'test'
  require 'simplecov'
  SimpleCov.start 'rails'
  puts "required simplecov"
end



RSpec.configure do |config|
  config.before do
      ActionMailer::Base.deliveries.clear
  config.include Devise::TestHelpers, :type => :controller
  config.include EmailSpec::Helper
end
