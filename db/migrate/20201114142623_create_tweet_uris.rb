class CreateTweetUris < ActiveRecord::Migration[6.0]
  def change
    create_table :tweet_uris do |t|
      t.references :tweet, index: true

      t.string :url
      t.string :expanded_url
      t.string :display_url
      t.integer :indice_start
      t.integer :indice_end

      t.timestamps
    end
  end
end
