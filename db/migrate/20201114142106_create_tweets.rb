class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.references :twitter_following, index: true

      t.bigint :identifier, null: false
      t.string :content, null: false
      t.datetime :tweeted_at, null: false
      t.boolean :truncated, default: false, null: false
      t.boolean :retweet, default: false, null: false
      t.bigint :retweet_identifier
      t.boolean :quote, default: false, null: false
      t.bigint :quote_identifier

      t.timestamps
    end
  end
end
