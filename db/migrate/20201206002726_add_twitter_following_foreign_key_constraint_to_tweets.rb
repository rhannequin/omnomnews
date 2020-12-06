# frozen_string_literal: true

class AddTwitterFollowingForeignKeyConstraintToTweets < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :tweets, :twitter_followings
  end
end
