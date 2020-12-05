# frozen_string_literal: true

class Om::RssFeed::Create < Om::Service
  def initialize(uri)
    @uri = uri
    super()
  end

  perform do
    RssFeed.create!(rss_feed_attributes)
  rescue Om::Errors::RssFeedParsingError => e
    add_error(e.message)
  end

  private

  attr_reader :uri

  def feed
    @feed ||=
      Om::RssFeed::Proxy.new(
        uri,
        Om::RssFeed::Parse.new(uri).parse,
      )
  end

  def rss_feed_attributes
    feed
      .attributes
      .tap { |attr| attr[:items] = items if items&.any? }
  end

  def items
    feed
      .entries
      .map { |item| RssFeedItem.new(item.attributes) }
  end
end
