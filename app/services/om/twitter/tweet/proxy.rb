# frozen_string_literal: true

class Om::Twitter::Tweet::Proxy
  def initialize(twitter_following, tweet)
    @twitter_following = twitter_following
    @tweet = tweet
  end

  def attributes
    {
      identifier: tweet.id,
      content: tweet.full_text,
      tweeted_at: tweet.created_at,
      truncated: tweet.truncated?,
      retweet: tweet.retweet?,
      quote: tweet.quote?,
    }.tap { |attr| optional_attributes(tweet, attr) }
  end

  private

  attr_reader :twitter_following, :tweet

  def optional_attributes(tweet, attr)
    attr[:retweet_identifier] = tweet.retweeted_status if tweet.retweet?
    attr[:quote_identifier] = tweet.quoted_status if tweet.quote?

    if tweet.uris?
      attr[:tweet_uris] = tweet.uris.map do |uri|
        ::TweetUri.new(
          url: uri.url,
          expanded_url: uri.expanded_url,
          display_url: uri.display_url,
          indice_start: uri.indices.first,
          indice_end: uri.indices.last,
        )
      end
    end
  end
end
