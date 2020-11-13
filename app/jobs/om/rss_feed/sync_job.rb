# frozen_string_literal: true

class Om::RssFeed::SyncJob < Om::SidekiqJob
  def perform(rss_feed_id)
    rss_feed = ::RssFeed.find(rss_feed_id)

    Om::RssFeed::Sync.new(rss_feed).perform
  end
end
