# frozen_string_literal: true

require "rails_helper"

describe Om::Twitter::UnfollowUser do
  describe "#perform" do
    it "destroys the record" do
      twitter_following = FactoryBot.create(:twitter_following)
      expect { described_class.new(twitter_following).perform }.to(
        change(TwitterFollowing, :count).by(-1)
      )
    end
  end
end
