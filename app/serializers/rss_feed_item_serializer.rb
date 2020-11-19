# frozen_string_literal: true

class RssFeedItemSerializer
  include FastJsonapi::ObjectSerializer

  belongs_to :rss_feed, serializer: RssFeedSerializer

  attributes :identifier, :title, :link, :published_at
end
