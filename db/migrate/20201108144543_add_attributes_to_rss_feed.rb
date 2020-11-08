class AddAttributesToRssFeed < ActiveRecord::Migration[6.0]
  def change
    add_column :rss_feeds, :title, :string, after: :uri, null: false
    add_column :rss_feeds, :link, :string, after: :title
    add_column :rss_feeds, :description, :text, after: :link
  end
end
