# frozen_string_literal: true

require "rails_helper"

describe "api/v1/grouped_elements/index", type: :view do
  include_context "serializer"

  let(:time) { DateTime.new(2020, 11, 20) }
  let(:tweet) { FactoryBot.create(:tweet, tweeted_at: time) }
  let(:rss_feed_item) { FactoryBot.create(:rss_feed_item, published_at: time) }

  let(:grouped_elements) { { time => [tweet, rss_feed_item] } }

  before { assign(:grouped_elements, grouped_elements) }

  let(:expected_json) do
    {
      data: [
        {
          time: "2020-11-20T00:00:00.000+00:00",
          elements: [
            {
              type: :tweet,
              content: tweet.content,
              truncated: tweet.truncated?,
              retweet: tweet.retweet?,
              retweet_author: tweet.retweet_author,
              quote: tweet.quote?,
              author: {
                username: tweet.twitter_following.username,
              },
              uris: [],
            },
            {
              type: :rss_feed_item,
              title: rss_feed_item.title,
              link: rss_feed_item.link,
              rss_feed: {
                id: rss_feed_item.rss_feed.id,
                title: rss_feed_item.rss_feed.title,
              },
            },
          ],
        },
      ],
    }
  end

  it_behaves_like "a JSON view"
end
