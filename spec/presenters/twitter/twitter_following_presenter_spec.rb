# frozen_string_literal: true

require "rails_helper"

describe Twitter::TwitterFollowingPresenter, :twitter_fake_api do
  describe "#timeline" do
    let(:twitter_following) { FactoryBot.create(:twitter_following) }
    subject { described_class.new(twitter_following) }

    it "works" do
      expect { subject.timeline }.not_to raise_error
    end
  end
end
