# frozen_string_literal: true

require "rails_helper"

describe Om::RssFeed::Parse do
  let(:rss_feed) { FactoryBot.create(:rss_feed) }
  subject { described_class.new(rss_feed) }

  let(:uri_http_dbl) { instance_double(URI::HTTP) }

  let(:rss_feed_dbl) do
    path = Rails.root.join("spec/fixtures/rss_feed.xml")
    File.read(path)
  end

  before do
    allow(URI).to receive(:parse).and_return(uri_http_dbl)
    allow(uri_http_dbl).to receive(:open).and_return(rss_feed_dbl)
  end

  describe "#parse" do
    it "does something" do
      expect(RSS::Parser).to receive(:parse).with(rss_feed_dbl)

      subject.parse
    end
  end
end
