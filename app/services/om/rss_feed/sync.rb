# frozen_string_literal: true

class Om::RssFeed::Sync < Om::Service
  def initialize(rss_feed)
    @rss_feed = rss_feed
    super()
  end

  perform do
    items.each do |item|
      unless @rss_feed.items.exists?(identifier: item.identifier)
        @rss_feed.items << item
      end
    end
  end

  private

  attr_reader :rss_feed

  def feed
    @feed ||=
      Om::RssFeed::Proxy.new(
        rss_feed.uri,
        Om::RssFeed::Parse.new(rss_feed.uri).parse
      )
  end

  def items
    feed.entries.map { |item| RssFeedItem.new(item.attributes) }
  end
end
