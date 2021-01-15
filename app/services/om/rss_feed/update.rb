# frozen_string_literal: true

class Om::RssFeed::Update < Om::Service
  def initialize(rss_feed_id:, uri:)
    @rss_feed = RssFeed.find(rss_feed_id)
    @uri = uri
    super()
  end

  perform do
    rss_feed.update!(rss_feed_attributes)
    Om::RssFeed::Sync.new(rss_feed).perform
  rescue Om::Errors::RssFeedParsingError => e
    add_error(e.message)
  end

  private

  attr_reader :rss_feed, :uri

  def feed
    @feed ||= Om::RssFeed::Proxy.new(uri, Om::RssFeed::Parse.new(uri).parse)
  end

  def rss_feed_attributes
    feed.attributes.tap do |attr|
      attr[:items] = items if items&.any?
    end
  end

  def items
    feed.entries.map { |item| RssFeedItem.new(item.attributes) }
  end
end
