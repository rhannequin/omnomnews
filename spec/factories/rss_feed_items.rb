# frozen_string_literal: true

FactoryBot.define do
  factory :rss_feed_item do
    rss_feed
    identifier { "identifier-#{rand}" }
    title { "Random Rss Feed Item Title" }
    link { "https://getaround.tech/rails-6-unnoticed-features/" }
    published_at { Time.current }
  end
end
