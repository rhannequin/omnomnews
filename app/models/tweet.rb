# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :twitter_following

  has_many :tweet_uris, dependent: :destroy
end
