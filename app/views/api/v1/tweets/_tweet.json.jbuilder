json.type :tweet
json.(tweet, :content, :truncated, :retweet, :quote)

json.author do
  json.username tweet.twitter_following.username
end

json.uris tweet.tweet_uris, :url, :expanded_url, :display_url, :indice_start, :indice_end
