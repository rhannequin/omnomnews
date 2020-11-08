# frozen_string_literal: true

class Api::V1::RssFeedItemsController < Api::V1::Base
  before_action :set_rss_feed

  def index
    @rss_feed_items = @rss_feed.items.order(published_at: :desc)

    render json: RssFeedItemSerializer.new(@rss_feed_items)
  end

  private

  def set_rss_feed
    @rss_feed =
      RssFeed
        .includes(:items)
        .find(params.fetch(:rss_feed_id))
  end
end
