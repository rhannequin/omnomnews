# frozen_string_literal: true

class Om::Twitter::TwitterFollowing::SyncAllJob < Om::SidekiqJob
  def perform
    ::TwitterFollowing.find_each do |twitter_following|
      Om::Twitter::TwitterFollowing::SyncJob.perform_now(twitter_following.id)
    end
  end
end
