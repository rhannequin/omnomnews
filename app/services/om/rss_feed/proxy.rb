# frozen_string_literal: true

class Om::RssFeed::Proxy
  def initialize(uri, parsed_rss_feed)
    @uri = uri
    @parsed_rss_feed = parsed_rss_feed
  end

  def attributes
    {
      uri: uri,
      title: title,
      description: description,
      link: link,
    }
  end

  def entries
    (
      main.try(:items) ||
      main.try(:entries) ||
      []
    ).map do |entry|
      Om::RssFeedItem::Proxy.new(entry)
    end
  end

  private

  attr_reader :uri, :parsed_rss_feed

  def main
    parsed_rss_feed.try(:channel) || parsed_rss_feed
  end

  def title
    main.title.try(:content) || main.title
  end

  def description
    main.try(:description)
  end

  def link
    main.try(:link).try(:href) || main.try(:link)
  end
end
