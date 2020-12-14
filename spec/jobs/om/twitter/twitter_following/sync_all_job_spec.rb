# frozen_string_literal: true

require "rails_helper"

describe Om::Twitter::TwitterFollowing::SyncAllJob do
  describe "#perform_now" do
    subject(:job) { described_class.perform_now }

    before { ActiveJob::Base.queue_adapter = :test }

    let!(:twitter_following) { FactoryBot.create(:twitter_following) }

    it "enqueues sync job for existing record" do
      job
      expect(Om::Twitter::TwitterFollowing::SyncJob).to(
        have_been_enqueued.with(twitter_following.id)
      )
    end
  end
end
