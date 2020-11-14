# frozen_string_literal: true

class TwitterFollowingSerializer
  include FastJsonapi::ObjectSerializer

  attributes :username

  has_many :tweets, serializer: ::TweetSerializer
end
