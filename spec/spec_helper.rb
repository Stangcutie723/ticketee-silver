config.include EmailSpec::Helpers

RSpec.configure do |config|
  config.before do
    ActionMailer::Base.deliveries.clear
  end
end
