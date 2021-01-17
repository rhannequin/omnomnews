# frozen_string_literal: true

class AddAccountIdToRssFeeds < ActiveRecord::Migration[6.1]
  def change
    add_column :rss_feeds, :account_id, :integer
    add_foreign_key :rss_feeds, :accounts
  end
end
