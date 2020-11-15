# frozen_string_literal: true

class Om::SyncAllSourcesJob < Om::SidekiqJob
  def perform
    Om::Twitter::TwitterFollowing::SyncAllJob.perform_later
    Om::RssFeed::SyncAllJob.perform_later
  end
end
