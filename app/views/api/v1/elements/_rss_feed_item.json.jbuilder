# frozen_string_literal: true

json.type :rss_feed_item
json.call(rss_feed_item, :title, :link)

json.rss_feed do
  json.call(rss_feed_item.rss_feed, :id, :title)
end
