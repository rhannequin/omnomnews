# frozen_string_literal: true

class TwitterFollowing < ApplicationRecord
  belongs_to :account

  has_many :tweets, dependent: :destroy

  validates :username, presence: true
end
