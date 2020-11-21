# frozen_string_literal: true

require "rails_helper"

describe Om::Twitter::SyncUser, :twitter_fake_api do
  describe "#perform" do
    subject { described_class.new(twitter_following) }

    let(:twitter_following) { FactoryBot.create(:twitter_following) }

    it "creates a tweet with uris" do
      expect { subject.perform }
        .to change { Tweet.count }.by(1)
        .and change { TweetUri.count }.by(1)
    end

    context "when tweet already exists" do
      let(:tweet_identifier) { 987654321 }

      let!(:existing_tweet) do
        FactoryBot.create(
          :tweet,
          twitter_following: twitter_following,
          identifier: tweet_identifier,
        )
      end

      let(:raw_tweet) do
        {
          identifier: tweet_identifier,
          content: "Tweet content",
          tweeted_at: Time.current,
        }
      end

      before do
        allow_any_instance_of(Om::Twitter::Tweet::Proxy).to(
          receive(:attributes).and_return(raw_tweet)
        )
      end

      it "doesn't create a tweet" do
        expect { subject.perform }.not_to(change { Tweet.count })
      end
    end
  end
end
