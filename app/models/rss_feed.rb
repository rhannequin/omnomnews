# frozen_string_literal: true

class RssFeed < ApplicationRecord
  belongs_to :account

  has_many :items, class_name: "RssFeedItem", dependent: :destroy

  validates :uri, :title, presence: true
end
