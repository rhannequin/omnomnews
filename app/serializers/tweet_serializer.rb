# frozen_string_literal: true

class TweetSerializer
  include FastJsonapi::ObjectSerializer

  attributes :content

  has_many :tweet_uris, serializer: ::TweetUriSerializer
end
