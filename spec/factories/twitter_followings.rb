# frozen_string_literal: true

FactoryBot.define do
  factory :twitter_following do
    account
    username { "rails" }
  end

  trait :with_tweets do
    after(:create) do |twitter_following|
      FactoryBot.create(:tweet, twitter_following: twitter_following)
    end
  end
end
