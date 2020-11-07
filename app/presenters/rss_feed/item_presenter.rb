# frozen_string_literal: true

class RssFeed::ItemPresenter
  delegate :title, to: :rss_feed_item

  def initialize(rss_feed_item)
    @rss_feed_item = rss_feed_item
  end

  private

  attr_reader :rss_feed_item
end
