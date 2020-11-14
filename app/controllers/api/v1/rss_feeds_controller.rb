# frozen_string_literal: true

class Api::V1::RssFeedsController < Api::V1::Base
  def index
    @rss_feeds = RssFeed.includes(:items)

    render json: RssFeedSerializer.new(@rss_feeds, include: [:items])
  end
end
