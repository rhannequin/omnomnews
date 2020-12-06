# frozen_string_literal: true

class AddRssFeedForeignKeyConstraintToRssFeedItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :rss_feed_items, :rss_feeds
  end
end
