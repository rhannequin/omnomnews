# frozen_string_literal: true

require "rails_helper"

describe Om::RssFeed::Create do
  describe "#perform" do
    let(:uri) { "https://www.google.com" }
    subject { described_class.new(uri) }

    it "creates a new RssFeed" do
      expect { subject.perform }.to change { RssFeed.count }.by(1) 
    end
  end
end
