# frozen_string_literal: true

class ChangeAccountIdTypeOnRssFeeds < ActiveRecord::Migration[6.1]
  def change
    change_column :rss_feeds, :account_id, :bigint
  end
end
