# frozen_string_literal: true

require "rails_helper"

describe Om::RssFeed::SyncAllJob do
  describe "#perform_now" do
    subject(:job) { described_class.perform_now }

    before { ActiveJob::Base.queue_adapter = :test }

    let!(:rss_feed) { FactoryBot.create(:rss_feed) }

    it "enqueues sync job for existing record" do
      job
      expect(Om::RssFeed::SyncJob).to(
        have_been_enqueued.with(rss_feed.id)
      )
    end
  end
end
