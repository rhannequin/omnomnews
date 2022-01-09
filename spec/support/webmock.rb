# frozen_string_literal: true

require "webmock/rspec"

RSpec.configure do |config|
  config.before(:all) do
    driver_urls = Webdrivers::Common.subclasses.map(&:base_url)
    selenium_requests = %r{/((__.+__)|(hub/session.*))$}

    WebMock.disable_net_connect!(
      allow_localhost: true,
      allow: [driver_urls, selenium_requests]
    )
  end
end
