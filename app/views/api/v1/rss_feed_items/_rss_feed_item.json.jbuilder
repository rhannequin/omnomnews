json.type :rss_feed_item
json.(rss_feed_item, :title, :link)

json.rss_feed do
  json.(rss_feed_item.rss_feed, :id, :title)
  json.path api_v1_rss_feed_url(rss_feed_item.rss_feed)
end
