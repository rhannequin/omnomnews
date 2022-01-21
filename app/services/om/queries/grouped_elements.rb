# frozen_string_literal: true

class Om::Queries::GroupedElements
  THRESHOLD = 50

  def initialize(account:)
    @account = account
  end

  def fetch
    grouped_rss_feed_items
      .merge(grouped_tweets) do |_, first_array, second_array|
        first_array | second_array
      end
      .sort
      .reverse
  end

  private

  attr_reader :account

  def grouped_rss_feed_items
    RssFeedItem
      .includes(:rss_feed)
      .where(rss_feed: {account_id: account.id})
      .order(published_at: :desc)
      .limit(THRESHOLD)
      .group_by { |rss_feed_item| rss_feed_item.published_at.to_date }
  end

  def grouped_tweets
    Tweet
      .includes(:twitter_following, :tweet_uris)
      .where(twitter_following: {account_id: account.id})
      .order(tweeted_at: :desc)
      .limit(THRESHOLD)
      .group_by { |tweet| tweet.tweeted_at.to_date }
  end
end
