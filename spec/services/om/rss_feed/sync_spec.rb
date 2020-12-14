# frozen_string_literal: true

require "rails_helper"

describe Om::RssFeed::Sync do
  describe "#perform" do
    subject(:service) { described_class.new(rss_feed) }

    let(:rss_feed) { FactoryBot.create(:rss_feed, :with_items) }

    let(:new_item) { { title: "New Item Title", id: "new-item-identifier" } }

    let(:feed_object) do
      {
        channel: {
          title: rss_feed.title,
          items:
            rss_feed
              .items
              .map { |item| { id: item.identifier, title: item.title } }
              .append(new_item),
        },
      }
    end

    let(:fake_rss_feed) do
      JSON.parse(feed_object.to_json, object_class: OpenStruct)
    end

    before do
      parse_dbl = instance_double(Om::RssFeed::Parse, parse: fake_rss_feed)
      allow(Om::RssFeed::Parse).to receive(:new).and_return(parse_dbl)
    end

    it "adds a new RssFeedItem" do
      expect { service.perform }.to change { rss_feed.reload.items.count }.by(1)
    end

    context "when no new item had to be added" do
      let(:feed_object) do
        {
          channel: {
            title: rss_feed.title,
            items:
              rss_feed.items.map do |item|
                { id: item.identifier, title: item.title }
              end,
          },
        }
      end

      it "doesn't add a new RssFeedItem" do
        expect { service.perform }.not_to(
          change { rss_feed.reload.items.count },
        )
      end
    end
  end
end
