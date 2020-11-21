# frozen_string_literal: true

class RssFeed < ApplicationRecord
  has_many :items, class_name: "RssFeedItem", dependent: :destroy
end
