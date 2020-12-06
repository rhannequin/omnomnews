# frozen_string_literal: true

class AddTweetForeignKeyConstraintToTweetUris < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :tweet_uris, :tweets
  end
end
