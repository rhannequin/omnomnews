# frozen_string_literal: true

require "webmock/rspec"

RSpec.configure do |config|
  config.before(:all) do
    WebMock.disable_net_connect!(
      allow: [
        ->(uri) { ["localhost", "127.0.0.1"].include?(uri.host) },
      ],
    )
  end
end
