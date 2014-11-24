require "guard-webhook-notifier"
require "webmock/rspec"

RSpec.configure do |config|
  config.color = true
  config.run_all_when_everything_filtered = true
end
