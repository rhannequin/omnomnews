# frozen_string_literal: true

class RssFeedItemSerializer
  include FastJsonapi::ObjectSerializer

  attributes :identifier, :title, :link, :published_at
end
