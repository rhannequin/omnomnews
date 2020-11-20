# frozen_string_literal: true

class Om::Twitter::SyncUser < Om::Service
  def initialize(twitter_following)
    @twitter_following = twitter_following
    super()
  end

  perform do
    client
      .user_timeline(twitter_following.username, default_options)
      .map do |raw_tweet|
        tweet = ::Tweet.new(Om::Twitter::Tweet::Proxy.new(raw_tweet).attributes)

        unless twitter_following.tweets.exists?(identifier: tweet.identifier)
          twitter_following.tweets << tweet
        end
      end
  end

  private

  attr_reader :twitter_following

  def client
    @client ||= Om::Twitter::Client.new.provider
  end

  def default_options
    {
      exclude_replies: true,
    }
  end
end
