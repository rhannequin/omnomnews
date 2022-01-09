# frozen_string_literal: true

require "rails_helper"

describe Om::Twitter::Tweet::Proxy, :twitter_fake_api do
  subject { described_class.new(tweet) }

  let(:tweet) do
    JSON.parse(
      {
        id: 1,
        full_text: "Tweet content",
        created_at: "Fri Nov 20 18:00:00 +0000 2020",
        truncated?: false,
        retweet?: retweet?,
        quote?: quote?,
        uris?: uris?,
        uris: [uri],
        retweeted_tweet: retweeted_tweet,
        quoted_status: 3
      }.to_json,
      object_class: OpenStruct
    )
  end

  let(:retweet?) { false }
  let(:quote?) { false }
  let(:uris?) { true }

  let(:uri) do
    {
      url: "https://t.co/AbCdEfGhiJ",
      expanded_url: "https://twitter.com/i/web/status/1234567890...",
      display_url: "twitter.com/i/web/status/1…",
      indices: [1, 2]
    }
  end

  let(:retweeted_tweet) { nil }

  shared_examples "attributes match" do
    it "contains all the expected attributes" do
      expect(attributes).to match(expected_attributes)
    end
  end

  describe "#attributes" do
    let(:attributes) { subject.attributes }

    let(:main_expected_attributes) do
      {
        identifier: 1,
        content: "Tweet content",
        tweeted_at: "Fri Nov 20 18:00:00 +0000 2020",
        truncated: false,
        retweet: false,
        quote: false,
        tweet_uris_attributes: [
          {
            url: "https://t.co/AbCdEfGhiJ",
            expanded_url: "https://twitter.com/i/web/status/1234567890...",
            display_url: "twitter.com/i/web/status/1…",
            indice_start: 1,
            indice_end: 2
          }
        ]
      }
    end

    let(:expected_attributes) { main_expected_attributes }

    it "works" do
      expect { attributes }.not_to raise_error
    end

    include_examples "attributes match"

    context "when tweet has no uris" do
      let(:uris?) { false }

      let(:expected_attributes) do
        main_expected_attributes.except(:tweet_uris_attributes)
      end

      include_examples "attributes match"
    end

    context "when tweet is a retweet" do
      let(:retweet?) { true }

      let(:retweeted_tweet) do
        {
          id: 2,
          full_text: "Retweeted tweet content",
          created_at: "Thu Nov 19 18:00:00 +0000 2020",
          truncated?: true,
          retweet?: false,
          quote?: false,
          uris?: false,
          uris: [],
          user: {screen_name: "rails"}
        }
      end

      let(:expected_attributes) do
        main_expected_attributes
          .merge(
            {
              content: "Retweeted tweet content",
              truncated: true,
              retweet: true,
              retweet_identifier: 2,
              retweet_author: "rails"
            }
          )
          .except(:tweet_uris_attributes)
      end

      include_examples "attributes match"
    end

    context "when tweet is a quote" do
      let(:quote?) { true }

      let(:expected_attributes) do
        main_expected_attributes.merge({quote: true, quote_identifier: 3})
      end

      include_examples "attributes match"
    end
  end
end
