# frozen_string_literal: true

require "rails_helper"

describe Om::Twitter::SyncUser, :twitter_fake_api do
  describe "#perform" do
    subject(:service) { described_class.new(twitter_following) }

    let(:twitter_following) { FactoryBot.create(:twitter_following) }

    it "creates a tweet with uris" do
      expect { service.perform }.to change(Tweet, :count).by(1).and change(
        TweetUri,
        :count,
      ).by(1)
    end

    context "when tweet already exists" do
      let(:tweet_identifier) { 987_654_321 }

      let(:raw_tweet) do
        {
          identifier: tweet_identifier,
          content: "Tweet content",
          tweeted_at: Time.current,
        }
      end

      let(:proxy) do
        instance_double(Om::Twitter::Tweet::Proxy, attributes: raw_tweet)
      end

      before do
        FactoryBot.create(
          :tweet,
          twitter_following: twitter_following,
          identifier: tweet_identifier,
        )

        allow(Om::Twitter::Tweet::Proxy).to receive(:new).and_return(proxy)
      end

      it "doesn't create a tweet" do
        expect { service.perform }.not_to(change(Tweet, :count))
      end
    end
  end
end
