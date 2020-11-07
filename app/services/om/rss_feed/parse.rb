# frozen_string_literal: true

require "rss"
require "open-uri"

class Om::RssFeed::Parse
  def initialize(rss_feed)
    @rss_feed = rss_feed
    super()
  end

  def parse
    rss = URI.parse(rss_feed.uri).open
    RSS::Parser.parse(rss)
  end

  private

  attr_reader :rss_feed
end
