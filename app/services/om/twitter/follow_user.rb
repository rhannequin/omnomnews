# frozen_string_literal: true

class Om::Twitter::FollowUser < Om::Service
  def initialize(username)
    @username = username
    super()
  end

  perform { create_twitter_following! }

  private

  attr_reader :username

  def create_twitter_following!
    TwitterFollowing.create!(username: username)
  end
end
