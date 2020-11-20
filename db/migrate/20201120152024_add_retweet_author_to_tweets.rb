class AddRetweetAuthorToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :retweet_author, :string
  end
end
