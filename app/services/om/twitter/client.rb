# frozen_string_literal: true

class Om::Twitter::Client
  def provider_class
    Twitter::REST::Client
  end

  def provider
    @provider ||=
      provider_class.new do |config|
        config.consumer_key =
          Rails.application.credentials.fetch(:twitter_api_key)
        config.consumer_secret =
          Rails.application.credentials.fetch(:twitter_api_secret_key)
        config.access_token =
          Rails.application.credentials.fetch(:twitter_access_token)
        config.access_token_secret =
          Rails.application.credentials.fetch(:twitter_access_token_secret)
      end
  end
end
