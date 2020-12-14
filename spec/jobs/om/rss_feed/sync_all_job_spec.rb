# frozen_string_literal: true

require "rails_helper"

describe Om::RssFeed::SyncAllJob do
  describe "#perform_now" do
    subject(:job) { described_class.perform_now }

    let!(:rss_feed) { FactoryBot.create(:rss_feed) }

    it "enqueues sync job for existing record" do
      expect(Om::RssFeed::SyncJob).to(
        receive(:perform_later).with(rss_feed.id), # rubocop:disable RSpec/MessageSpies
      )
      job
    end
  end
end
