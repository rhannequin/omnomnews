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
    end

    context "when parsing failed" do
      let(:error_message) { "Something failed" }

      before do
        parse_dbl = double(Om::RssFeed::Parse)
        allow(Om::RssFeed::Parse).to receive(:new).and_return(parse_dbl)
        allow(parse_dbl).to(
          receive(:parse)
            .and_raise(Om::Errors::RssFeedParsingError, error_message)
        )
      end

      it "returns false" do
        expect(subject.perform).to eq(false)
      end

      it "adds the error to the service" do
        subject.perform
        expect(subject.errors).to include(error_message)
      end
    end
  end
end
