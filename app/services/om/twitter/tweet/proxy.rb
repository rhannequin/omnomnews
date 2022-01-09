# frozen_string_literal: true

class Om::Twitter::Tweet::Proxy
  def initialize(tweet)
    @tweet = tweet
  end

  def attributes
    {
      identifier: tweet.id,
      content: main_tweet.full_text,
      tweeted_at: tweet.created_at,
      truncated: main_tweet.truncated?,
      retweet: tweet.retweet?,
      quote: tweet.quote?
    }.tap { |attr| optional_attributes(tweet, attr) }
  end

  private

  attr_reader :tweet

  def optional_attributes(tweet, attr)
    if tweet.retweet?
      attr[:retweet_identifier] = main_tweet.id
    end
    if tweet.retweet?
      attr[:retweet_author] = main_tweet.user.screen_name
    end
    if tweet.quote?
      attr[:quote_identifier] = tweet.quoted_status
    end

    unless main_tweet.uris?
      return
    end

    attr[:tweet_uris_attributes] =
      main_tweet.uris.map do |uri|
        {
          url: uri.url,
          expanded_url: uri.expanded_url,
          display_url: uri.display_url,
          indice_start: uri.indices.first,
          indice_end: uri.indices.last
        }
      end
  end

  def main_tweet
    retweeted_tweet || tweet
  end

  def retweeted_tweet
    unless tweet.retweet?
      return
    end

    @retweeted_tweet ||= tweet.retweeted_tweet
  end
end
