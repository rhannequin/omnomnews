# frozen_string_literal: true

require "rails_helper"

describe Om::Twitter::TwitterFollowing::SyncJob do
  describe "#perform_now" do
    subject(:job) { described_class.perform_now(twitter_following.id) }

    let!(:twitter_following) { FactoryBot.create(:twitter_following) }
    let(:sync_user_dbl) do
      instance_double(Om::Twitter::SyncUser, perform: true)
    end

    before do
      allow(Om::Twitter::SyncUser).to(
        receive(:new).with(twitter_following).and_return(sync_user_dbl)
      )
    end

    it "calls sync service" do
      job
      expect(sync_user_dbl).to have_received(:perform)
    end
  end
end
