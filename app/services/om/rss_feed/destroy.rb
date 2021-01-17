# frozen_string_literal: true

class Om::RssFeed::Destroy < Om::Service
  def initialize(rss_feed)
    @rss_feed = rss_feed
    super()
  end

  perform do
    @rss_feed.destroy!
  end
end
