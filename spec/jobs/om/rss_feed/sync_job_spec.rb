# frozen_string_literal: true

require "rails_helper"

describe Om::RssFeed::SyncJob do
  describe "#perform_now" do
    subject { described_class.perform_now(rss_feed.id) }

    let!(:rss_feed) { FactoryBot.create(:rss_feed) }

    it "calls sync service" do
      sync_dbl = double(Om::RssFeed::Sync)
      allow(Om::RssFeed::Sync).to(
        receive(:new).with(rss_feed).and_return(sync_dbl)
      )
      expect(sync_dbl).to receive(:perform)

      subject
    end
  end
end
