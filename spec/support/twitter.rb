RSpec.configure do |config|
  config.before(:each, twitter_fake_api: true) do |_|
    allow_any_instance_of(Om::Twitter::Client).to(
      receive(:provider_class).and_return(TwitterFake::Client)
    )
  end
end
