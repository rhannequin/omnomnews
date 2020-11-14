# frozen_string_literal: true

class Om::Twitter::TwitterFollowing::SyncJob < Om::SidekiqJob
  def perform(twitter_following_id)
    twitter_following = ::TwitterFollowing.find(twitter_following_id)

    Om::Twitter::SyncUser.new(twitter_following).perform
  end
end
