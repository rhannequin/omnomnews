# frozen_string_literal: true

class Api::V1::RssFeedItemsController < Api::V1::Base
  THRESHOLD = 20

  def index
    grouped_rss_feed_items = RssFeedItem
      .includes(:rss_feed)
      .order(published_at: :desc)
      .limit(THRESHOLD)
      .group_by { |rss_feed_item| rss_feed_item.published_at.to_date }

    grouped_tweets = Tweet
      .includes(:twitter_following, :tweet_uris)
      .order(tweeted_at: :desc)
      .limit(THRESHOLD)
      .group_by { |tweet| tweet.tweeted_at.to_date }

    @grouped_elements =
      grouped_rss_feed_items
        .merge(grouped_tweets) { |_, first_array, second_array| first_array | second_array }
        .sort
        .reverse
  end
end
