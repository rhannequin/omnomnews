# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each, twitter_fake_api: true) do |_|
    client =
      instance_double(
        Om::Twitter::Client,
        provider: TwitterFake::Client.new,
        provider_class: TwitterFake::Client,
      )
    allow(Om::Twitter::Client).to receive(:new).and_return(client)
  end
end
