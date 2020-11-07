# frozen_string_literal: true

FactoryBot.define do
  factory :rss_feed do
    uri { "https://weblog.rubyonrails.org/feed/atom.xml" }
  end
end
