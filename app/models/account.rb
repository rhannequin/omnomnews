# frozen_string_literal: true

class Account < ApplicationRecord
  has_many :rss_feeds, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
