# frozen_string_literal: true

class Om::RssFeed::SyncAllJob < Om::SidekiqJob
  def perform
    ::RssFeed.find_each do |rss_feed|
      Om::RssFeed::SyncJob.perform_now(rss_feed.id)
    end
  end
end
