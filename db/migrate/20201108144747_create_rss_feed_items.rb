class CreateRssFeedItems < ActiveRecord::Migration[6.0]
  def change
    create_table :rss_feed_items do |t|
      t.references :rss_feed, index: true

      t.string :identifier, null: false, index: true
      t.string :title, null: false
      t.string :link
      t.text :description
      t.datetime :published_at

      t.timestamps
    end
  end
end
