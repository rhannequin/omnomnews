# frozen_string_literal: true

require "rails_helper"

describe Om::RssFeed::Sync do
  describe "#perform" do
    subject { described_class.new(rss_feed) }

    let(:rss_feed) do
      FactoryBot.create(:rss_feed, :with_items)
    end

    let(:new_item) do
      {
        title: "New Item Title",
        id: "new-item-identifier",
      }
    end

    let(:feed_object) do
      {
        channel: {
          title: rss_feed.title,
          items: rss_feed.items.map do |item|
            {
              id: item.identifier,
              title: item.title,
            }
          end.append(new_item)
        },
      }
    end

    let(:fake_rss_feed) do
      JSON.parse(feed_object.to_json, object_class: OpenStruct)
    end

    before do
      parse_dbl = double(Om::RssFeed::Parse)
      allow(Om::RssFeed::Parse).to receive(:new).and_return(parse_dbl)
      allow(parse_dbl).to receive(:parse).and_return(fake_rss_feed)
    end

    it "adds a new RssFeedItem" do
      expect { subject.perform }.to change { rss_feed.reload.items.count }.by(1)
    end

    context "when no new item had to be added" do
      let(:feed_object) do
        {
          channel: {
            title: rss_feed.title,
            items: rss_feed.items.map do |item|
              {
                id: item.identifier,
                title: item.title,
              }
            end
          },
        }
      end

      it "doesn't add a new RssFeedItem" do
        expect { subject.perform }.not_to change { rss_feed.reload.items.count }
      end
    end
  end
end
