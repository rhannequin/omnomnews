# frozen_string_literal: true

require "rails_helper"

describe Om::RssFeed::Create do
  describe "#perform" do
    let(:uri) { "https://www.google.com" }
    subject { described_class.new(uri) }

    let(:feed_object) do
      {
        channel: {
          title: "Feed Title",
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

    it "creates a new RssFeed" do
      expect { subject.perform }
        .to change { RssFeed.count }.by(1)
        .and change { RssFeedItem.count }.by(0)
    end

    context "when feed has items" do
      let(:item) do
        {
          id: "identifier-#{rand}",
          title: "Feed Item Title",
        }
      end

      let(:feed_object) do
        {
          channel: {
            title: "Feed Title",
            items: [item],
          },
        }
      end

      it "creates a new RssFeed and its items" do
        expect { subject.perform }
          .to change { RssFeed.count }.by(1)
          .and change { RssFeedItem.count }.by(1)
      end

      context "when item has no data to generate identifier" do
        let(:item) { { title: "Feed Item Title" } }

        it "raises" do
          expect { subject.perform }.to(
            raise_error(Om::Errors::RssFeedItemIdentifierError)
          )
        end
      end
    end

    context "when feed has no channel" do
      let(:feed_object) do
        {
          title: {
            content: "Feed Title",
          },
        }
      end

      it "creates a new RssFeed" do
        expect { subject.perform }.to change { RssFeed.count }.by(1)
      end
    end
  end
end
