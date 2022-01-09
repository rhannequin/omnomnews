# frozen_string_literal: true

class Om::TweetPresenter
  include ActionView::Helpers::UrlHelper

  TWITTER_BASE_URL = "https://twitter.com"

  def initialize(tweet)
    @tweet = tweet
  end

  def enriched_content
    result = []

    splitted_content.each_with_index do |substring, i|
      uri = tweet.tweet_uris[i]
      result.push(substring)
      next unless uri

      result.push link(uri)
    end

    result.join
  end

  def twitter_account_url(username, options)
    link_to "@#{username}", "#{TWITTER_BASE_URL}/#{username}", options
  end

  private

  attr_reader :tweet

  def splitted_content
    content = [tweet.content]

    tweet.tweet_uris.each do |uri|
      content.map! { |substring| substring.split(uri.url) }.flatten!
    end

    content
  end

  def link(uri)
    link_to(
      uri.display_url,
      uri.expanded_url,
      class: "no-underline hover:underline text-blue-500",
      target: "_blank",
      rel: "noopener noreferrer"
    )
  end
end
