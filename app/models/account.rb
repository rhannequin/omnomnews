# frozen_string_literal: true

class Account < ApplicationRecord
  has_one(
    :account_password_hash,
    foreign_key: :id,
    inverse_of: :account,
    dependent: :destroy
  )

  has_many :rss_feeds, dependent: :destroy
  has_many :twitter_followings, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
