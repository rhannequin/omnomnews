# frozen_string_literal: true

FactoryBot.define do
  factory :rss_feed do
    uri { "https://weblog.rubyonrails.org/feed/atom.xml" }
    title { "Random Rss Feed Title" }
  end

  trait :with_items do
    after(:create) do |rss_feed|
      FactoryBot.create(:rss_feed_item, rss_feed: rss_feed)
    end
  end
end
