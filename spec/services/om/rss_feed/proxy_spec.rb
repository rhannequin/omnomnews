# frozen_string_literal: true

require "rails_helper"

describe Om::RssFeed::Proxy do
  let(:uri) { "https://google.com" }

  let(:minimal_attributes) do
    {
      uri: uri,
      title: "Feed Title",
    }
  end

  subject do
    described_class.new(
      uri,
      JSON.parse(
        parsed_rss_feed.to_json,
        object_class: OpenStruct,
      ),
    )
  end

  shared_examples "not raising" do
    it "does not raise_error" do
      expect { attribute }.not_to raise_error
    end
  end

  shared_examples "attribute present" do
    it "is present" do
      expect(attribute).to be_present
    end
  end

  describe "#attributes" do
    describe ":uri" do
      let(:parsed_rss_feed) { minimal_attributes }
      let(:attribute) { subject.attributes[:uri] }

      include_examples "not raising"
      include_examples "attribute present"
    end
  end
end
