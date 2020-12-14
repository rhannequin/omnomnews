# frozen_string_literal: true

require "rails_helper"

describe Om::Twitter::TwitterFollowing::SyncAllJob do
  describe "#perform_now" do
    subject(:job) { described_class.perform_now }

    let!(:twitter_following) { FactoryBot.create(:twitter_following) }

    it "enqueues sync job for existing record" do
      expect(Om::Twitter::TwitterFollowing::SyncJob).to(
        receive(:perform_later).with(twitter_following.id), # rubocop:disable RSpec/MessageSpies
      )
      job
    end
  end
end
