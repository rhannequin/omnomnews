# frozen_string_literal: true

require "rails_helper"

describe Om::Twitter::TwitterFollowing::SyncJob do
  describe "#perform_now" do
    subject { described_class.perform_now(twitter_following.id) }

    let!(:twitter_following) { FactoryBot.create(:twitter_following) }

    it "calls sync service" do
      sync_user_dbl = double(Om::Twitter::SyncUser)
      allow(Om::Twitter::SyncUser).to(
        receive(:new).with(twitter_following).and_return(sync_user_dbl)
      )
      expect(sync_user_dbl).to receive(:perform)

      subject
    end
  end
end
