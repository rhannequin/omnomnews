class AddNonNullConstraints < ActiveRecord::Migration[6.1]
  def change
    change_column_null :rss_feed_items, :rss_feed_id, false
    change_column_null :tweets, :twitter_following_id, false
    change_column_null :rss_feeds, :account_id, false
    change_column_null :tweet_uris, :tweet_id, false
  end
end
