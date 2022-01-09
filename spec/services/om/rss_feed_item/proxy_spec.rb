# frozen_string_literal: true

require "rails_helper"

describe Om::RssFeedItem::Proxy do
  subject do
    described_class.new(
      JSON.parse(parsed_rss_feed_item.to_json, object_class: OpenStruct)
    )
  end

  let(:minimal_attributes) do
    {id: "identifier-#{rand}", title: "Feed Item Title"}
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

  shared_examples "attribute not present" do
    it "is present" do
      expect(attribute).not_to be_present
    end
  end

  describe "#attributes" do
    describe ":identifier" do
      let(:parsed_rss_feed_item) { minimal_attributes }
      let(:attribute) { subject.attributes[:identifier] }

      include_examples "not raising"
      include_examples "attribute present"

      context "with 'id' content" do
        let(:parsed_rss_feed_item) do
          minimal_attributes.merge(id: {content: "identifier-#{rand}"})
        end

        include_examples "not raising"
        include_examples "attribute present"
      end

      context "with 'guid'" do
        let(:parsed_rss_feed_item) do
          {guid: "identifier-#{rand}", title: "Feed Item Title"}
        end

        include_examples "not raising"
        include_examples "attribute present"

        context "with 'guid' content" do
          let(:parsed_rss_feed_item) do
            {
              guid: {content: "identifier-#{rand}"},
              title: "Feed Item Title"
            }
          end

          include_examples "not raising"
          include_examples "attribute present"
        end
      end

      context "when item has no data to generate identifier" do
        let(:parsed_rss_feed_item) { minimal_attributes.except(:id) }

        it "raises" do
          expect { attribute }.to(
            raise_error(Om::Errors::RssFeedItemIdentifierError)
          )
        end
      end
    end

    describe ":title" do
      let(:parsed_rss_feed_item) { minimal_attributes }
      let(:attribute) { subject.attributes[:title] }

      include_examples "not raising"
      include_examples "attribute present"

      context "with 'title' content" do
        let(:parsed_rss_feed_item) do
          minimal_attributes.merge({title: {content: "Feed Item Title"}})
        end

        include_examples "not raising"
        include_examples "attribute present"
      end

      context "when item has no title" do
        let(:parsed_rss_feed_item) { minimal_attributes.except(:title) }

        include_examples "not raising"
        include_examples "attribute not present"
      end
    end

    describe ":description" do
      let(:parsed_rss_feed_item) { minimal_attributes }
      let(:attribute) { subject.attributes[:description] }

      include_examples "not raising"
      include_examples "attribute not present"

      context "with 'description'" do
        let(:parsed_rss_feed_item) do
          minimal_attributes.merge({description: "Rss Feed Item Description"})
        end

        include_examples "not raising"
        include_examples "attribute present"
      end
    end

    describe ":link" do
      let(:parsed_rss_feed_item) { minimal_attributes }
      let(:attribute) { subject.attributes[:link] }

      include_examples "not raising"
      include_examples "attribute not present"

      context "with 'link'" do
        let(:parsed_rss_feed_item) do
          minimal_attributes.merge({link: "https://google.com"})
        end

        include_examples "not raising"
        include_examples "attribute present"

        context "with 'link' href" do
          let(:parsed_rss_feed_item) do
            minimal_attributes.merge({link: {href: "https://google.com"}})
          end

          include_examples "not raising"
          include_examples "attribute present"
        end
      end
    end

    describe ":published_at" do
      let(:parsed_rss_feed_item) { minimal_attributes }
      let(:attribute) { subject.attributes[:published_at] }

      include_examples "not raising"
      include_examples "attribute present"

      context "with 'pubDate'" do
        let(:parsed_rss_feed_item) do
          minimal_attributes.merge(
            {pubDate: Time.zone.parse("2020-11-02T21:32:11+00:00")}
          )
        end

        include_examples "not raising"
        include_examples "attribute present"
      end
    end
  end
end
