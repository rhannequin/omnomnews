# frozen_string_literal: true

class Api::V1::RssFeedItemsController < Api::V1::Base
  THRESHOLD = 20

  def index
    @grouped_rss_feed_items = RssFeedItem
      .includes(:rss_feed)
      .order(published_at: :desc)
      .limit(THRESHOLD)
      .group_by { |rss_feed_item| rss_feed_item.published_at.to_date }
  end
end
