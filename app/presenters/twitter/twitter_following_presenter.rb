# frozen_string_literal: true

class Twitter::TwitterFollowingPresenter
  def initialize(twitter_following)
    @twitter_following = twitter_following
  end

  def timeline
    @timeline ||= client.user_timeline(twitter_following.username)
  end

  private

  attr_reader :twitter_following

  def client
    @client ||= Om::Twitter::Client.new.provider
  end
end
