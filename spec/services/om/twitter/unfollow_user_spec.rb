# frozen_string_literal: true

require "rails_helper"

describe Om::Twitter::UnfollowUser do
  describe "#perform" do
    subject(:service) { described_class.new(twitter_following) }

    let!(:twitter_following) { FactoryBot.create(:twitter_following) }

    it "destroys the record" do
      expect { service.perform }.to change(TwitterFollowing, :count).by(-1)
    end
  end
end
