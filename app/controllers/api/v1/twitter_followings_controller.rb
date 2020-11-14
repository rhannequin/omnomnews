# frozen_string_literal: true

class Api::V1::TwitterFollowingsController < Api::V1::Base
  def index
    @twitter_followings = TwitterFollowing.includes(:tweets)

    render(
      json: TwitterFollowingSerializer.new(
        @twitter_followings,
        include: [:tweets, "tweets.tweet_uris"],
      )
    )
  end
end
