# frozen_string_literal: true

class AddIndexToRssFeedsOnAccountId < ActiveRecord::Migration[6.1]
  def change
    add_index :rss_feeds, :account_id
  end
end
