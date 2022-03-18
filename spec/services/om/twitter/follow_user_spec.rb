# frozen_string_literal: true

require "rails_helper"

describe Om::Twitter::FollowUser do
  describe "#perform" do
    subject(:service) do
      described_class.new(
        FactoryBot.create(:account).id,
        "twitter-username"
      )
    end

    it "creates a new TwitterFollowing" do
      expect { service.perform }.to change(TwitterFollowing, :count).by(1)
    end
  end
end
