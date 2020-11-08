class CreateTwitterFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :twitter_followings do |t|
      t.string :username, null: false
      t.timestamps
    end
  end
end
