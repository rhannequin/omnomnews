# frozen_string_literal: true

class Om::Twitter::FollowUser < Om::Service
  def initialize(account_id, username)
    @account_id = account_id
    @username = username
    super()
  end

  perform { create_twitter_following! }

  private

  def create_twitter_following!
    TwitterFollowing.create!(
      account_id: @account_id,
      username: @username
    )
  end
end
