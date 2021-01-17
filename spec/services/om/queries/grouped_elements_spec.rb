# frozen_string_literal: true

require "rails_helper"

describe Om::Queries::GroupedElements do
  describe "#fetch" do
    subject { described_class.new(account: account) }

    let(:account) { FactoryBot.create(:account) }
    let(:fetch) { subject.fetch }

    context "when there is only one element" do
      let!(:tweet) { FactoryBot.create(:tweet) }

      it "contains the date and the element" do
        expect(fetch.first).to match([tweet.tweeted_at.to_date, [tweet]])
      end
    end

    context "when there are two elements with different dates" do
      let!(:tweet1) do
        FactoryBot.create(:tweet, tweeted_at: Time.current.midnight)
      end
      let!(:tweet2) do
        FactoryBot.create(:tweet, tweeted_at: Time.zone.yesterday.midnight)
      end

      it "contains the first date" do
        expect(fetch.first).to match([tweet1.tweeted_at.to_date, [tweet1]])
      end

      it "contains the second date" do
        expect(fetch.second).to match([tweet2.tweeted_at.to_date, [tweet2]])
      end
    end

    context "when there are two different elements for the same date" do
      let!(:tweet) do
        FactoryBot.create(:tweet, tweeted_at: Time.current.midnight)
      end

      let(:rss_feed) { FactoryBot.create(:rss_feed, account: account) }

      let!(:rss_feed_item) do
        FactoryBot.create(
          :rss_feed_item,
          rss_feed: rss_feed,
          published_at: Time.current.midnight,
        )
      end

      it "contains the two elements with only one date" do
        expect(fetch.first).to(
          match [tweet.tweeted_at.to_date, [rss_feed_item, tweet]]
        )
      end
    end
  end
end
