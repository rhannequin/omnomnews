# frozen_string_literal: true

class RssFeedSerializer
  include FastJsonapi::ObjectSerializer

  attributes :title, :description, :link

  has_many(
    :items,
    serializer: RssFeedItemSerializer,
    links: {
      self: -> (rss_feed) {
        Rails.application.routes.url_helpers
          .api_v1_rss_feed_rss_feed_items_path(rss_feed)
      }
    }
  )
end
