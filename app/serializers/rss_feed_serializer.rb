# frozen_string_literal: true

class RssFeedSerializer
  include FastJsonapi::ObjectSerializer

  attributes :title, :description, :link

  has_many :items, serializer: RssFeedItemSerializer
end
