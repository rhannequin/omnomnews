# frozen_string_literal: true

require "rails_helper"

describe RssFeed::FeedPresenter do
  let(:rss_feed) { FactoryBot.create(:rss_feed) }
  let(:rss_feed_title) { "Title" }

  let(:rss_feed_channel_dbl) do
    instance_double(RSS::Rss, channel: rss_feed_dbl)
  end

  let(:rss_feed_dbl) do
    instance_double(RSS::Rss::Channel, title: rss_feed_title)
  end

  subject(:presenter) do
    described_class.new(rss_feed)
  end

  before do
    parse_dbl = double(Om::RssFeed::Parse)
    allow(Om::RssFeed::Parse).to(
      receive(:new).with(rss_feed).and_return(parse_dbl)
    )
    allow(parse_dbl).to receive(:parse).and_return(rss_feed_channel_dbl)
  end

  describe "#title" do
    it "returns feed's title" do
      expect(presenter.title).to eq(rss_feed_title)
    end
  end
end
