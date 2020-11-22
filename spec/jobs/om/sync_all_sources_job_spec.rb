# frozen_string_literal: true

require "rails_helper"

describe Om::SyncAllSourcesJob do
  describe "#perform_now" do
    subject { described_class.perform_now }

    it "enqueues sync jobs" do
      expect(Om::Twitter::TwitterFollowing::SyncAllJob).to receive(:perform_later)
      expect(Om::RssFeed::SyncAllJob).to receive(:perform_later)
      subject
    end
  end
end
