# frozen_string_literal: true

class TwitterFollowing < ApplicationRecord
  has_many :tweets, dependent: :destroy
end
