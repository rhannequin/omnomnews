# frozen_string_literal: true

class RssFeedItem < ApplicationRecord
  belongs_to :rss_feed

  validates :identifier, :title, presence: true
end
