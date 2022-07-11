# frozen_string_literal: true

class Om::ContentRotationJob < Om::SidekiqJob
  THRESHOLD = 3.months

  def perform
    Tweet
      .where(tweeted_at: (..THRESHOLD.ago))
      .destroy_all

    RssFeedItem
      .where(published_at: (..THRESHOLD.ago))
      .destroy_all
  end
end
