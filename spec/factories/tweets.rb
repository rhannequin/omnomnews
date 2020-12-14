# frozen_string_literal: true

FactoryBot.define do
  factory :tweet do
    twitter_following
    identifier { 123_456_789 }
    content { "Tweet text… http://t.co/78pYTvWfJd" }
    tweeted_at { Time.zone.parse("Thu Apr 06 15:28:43 +0000 2017") }
  end
end
