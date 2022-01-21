class AddNonNullConstraintToTwitterFollowingsAccountId < ActiveRecord::Migration[7.0]
  def change
    change_column_null :twitter_followings, :account_id, false
  end
end
