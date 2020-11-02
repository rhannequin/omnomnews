class CreateRssFeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :rss_feeds do |t|
      t.string :uri, null: false
      t.timestamps
    end
  end
end
