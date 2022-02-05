# frozen_string_literal: true

class RssFeed < ApplicationRecord
  belongs_to :account

  has_many :items, class_name: "RssFeedItem", dependent: :destroy

  acts_as_taggable_on :tags

  validates :uri, :title, presence: true
end
