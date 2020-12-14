# frozen_string_literal: true

require "rails_helper"

describe Om::SyncAllSourcesJob do
  describe "#perform_now" do
    subject(:job) { described_class.perform_now }

    before { ActiveJob::Base.queue_adapter = :test }

    it "enqueues sync Twitter job" do
      job
      expect(Om::Twitter::TwitterFollowing::SyncAllJob).to have_been_enqueued
    end

    it "enqueues sync RSS feed job" do
      job
      expect(Om::RssFeed::SyncAllJob).to have_been_enqueued
    end
  end
end
