class AddAccountIdToTwitterFollowings < ActiveRecord::Migration[7.0]
  def change
    add_column :twitter_followings, :account_id, :bigint, null: false
    add_foreign_key :twitter_followings, :accounts
    add_index :twitter_followings, :account_id
  end
end
