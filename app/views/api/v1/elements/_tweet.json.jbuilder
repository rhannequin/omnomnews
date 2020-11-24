# frozen_string_literal: true

json.type :tweet
json.call(tweet, :content, :truncated, :retweet, :retweet_author, :quote)

json.author do
  json.username tweet.twitter_following.username
end

json.uris tweet.tweet_uris, :url, :expanded_url, :display_url, :indice_start, :indice_end