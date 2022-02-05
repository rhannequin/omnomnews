# frozen_string_literal: true

class TwitterFollowing < ApplicationRecord
  belongs_to :account

  has_many :tweets, dependent: :destroy

  acts_as_taggable_on :tags

  validates :username, presence: true
end
