# frozen_string_literal: true

require "rails_helper"

describe Om::Twitter::FollowUser do
  describe "#perform" do
    let(:username) { "twitter-username" }
    subject { described_class.new(username) }

    it "creates a new TwitterFollowing" do
      expect { subject.perform }.to change { TwitterFollowing.count }.by(1)
    end
  end
end
