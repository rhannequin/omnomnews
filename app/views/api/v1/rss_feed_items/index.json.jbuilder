json.data  @grouped_rss_feed_items do |time, rss_feed_items|
  json.set! :time, time

  json.rss_feed_items do
    json.array!(rss_feed_items, partial: "rss_feed_item", as: :rss_feed_item)
  end
end
