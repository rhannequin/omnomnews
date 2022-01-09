# frozen_string_literal: true

require "rails_helper"

describe Om::RssFeed::SyncJob do
  describe "#perform_now" do
    subject(:job) { described_class.perform_now(rss_feed.id) }

    let!(:rss_feed) { FactoryBot.create(:rss_feed) }
    let(:sync_dbl) { instance_double(Om::RssFeed::Sync, perform: true) }

    before do
      allow(Om::RssFeed::Sync).to(
        receive(:new).with(rss_feed).and_return(sync_dbl)
      )
    end

    it "calls sync service" do
      job
      expect(sync_dbl).to have_received(:perform)
    end
  end
end
