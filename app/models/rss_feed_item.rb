# frozen_string_literal: true

class RssFeedItem < ApplicationRecord
  belongs_to :rss_feed
end
