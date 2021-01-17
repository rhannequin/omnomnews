# frozen_string_literal: true

class Om::Twitter::UnfollowUser < Om::Service
  def initialize(twitter_following)
    @twitter_following = twitter_following
    super()
  end

  perform do
    @twitter_following.destroy!
  end
end
