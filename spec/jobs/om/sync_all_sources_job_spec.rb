# frozen_string_literal: true

require "rails_helper"

describe Om::SyncAllSourcesJob do
  describe "#perform_now" do
    subject(:job) { described_class.perform_now }

    it "enqueues sync Twitter job" do
      expect(Om::Twitter::TwitterFollowing::SyncAllJob).to(
        receive(:perform_later), # rubocop:disable RSpec/MessageSpies
      )
      job
    end

    it "enqueues sync RSS feed job" do
      expect(Om::RssFeed::SyncAllJob).to(
        receive(:perform_later), # rubocop:disable RSpec/MessageSpies
      )
      job
    end
  end
end
