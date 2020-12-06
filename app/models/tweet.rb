# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :twitter_following
  has_many :tweet_uris, dependent: :destroy

  accepts_nested_attributes_for :tweet_uris

  validates :identifier, :content, :tweeted_at, presence: true
end
