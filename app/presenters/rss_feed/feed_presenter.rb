# frozen_string_literal: true

class RssFeed::FeedPresenter
  delegate :items, to: :parsed_feed

  def initialize(rss_feed)
    @rss_feed = rss_feed
  end

  def title
    parsed_feed.channel.title
  end

  private

  attr_reader :rss_feed

  def parsed_feed
    @parsed_feed ||= Om::RssFeed::Parse.new(rss_feed).parse
  end
end
