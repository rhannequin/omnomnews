# frozen_string_literal: true

require "rails_helper"

describe Om::RssFeed::Create do
  describe "#perform" do
    subject(:service) { described_class.new(uri) }

    let(:uri) { "https://www.google.com" }
    let(:feed_object) { { channel: { title: "Feed Title" } } }
    let(:fake_rss_feed) do
      JSON.parse(feed_object.to_json, object_class: OpenStruct)
    end

    before do
      parse_dbl = instance_double(Om::RssFeed::Parse, parse: fake_rss_feed)
      allow(Om::RssFeed::Parse).to receive(:new).and_return(parse_dbl)
    end

    it "creates a new RssFeed" do
      expect { service.perform }.to change(RssFeed, :count).by(1).and change(
        RssFeedItem,
        :count,
      ).by(0)
    end

    context "when feed has items" do
      let(:item) { { id: "identifier-#{rand}", title: "Feed Item Title" } }

      let(:feed_object) { { channel: { title: "Feed Title", items: [item] } } }

      it "creates a new RssFeed and its items" do
        expect { service.perform }.to change(RssFeed, :count).by(1).and change(
          RssFeedItem,
          :count,
        ).by(1)
      end
    end

    context "when parsing failed" do
      let(:error_message) { "Something failed" }

      before do
        parse_dbl = instance_double(Om::RssFeed::Parse)
        allow(Om::RssFeed::Parse).to receive(:new).and_return(parse_dbl)
        allow(parse_dbl).to(
          receive(:parse).and_raise(
            Om::Errors::RssFeedParsingError,
            error_message,
          ),
        )
      end

      it "returns false" do
        expect(service.perform).to eq(false)
      end

      it "adds the error to the service" do
        service.perform
        expect(service.errors).to include(error_message)
      end
    end
  end
end
