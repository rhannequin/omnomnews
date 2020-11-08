# frozen_string_literal: true

class Om::RssFeed::Create < Om::Service
  def initialize(uri)
    @uri = uri
    super()
  end

  perform do
    RssFeed.create!(rss_feed_attributes)
  end

  private

  attr_reader :uri

  def parsed_rss_feed
    @parsed_rss_feed ||= Om::RssFeed::Parse.new(uri).parse
  end

  def rss_feed_attributes
    {
      uri: uri,
      title: title,
      description: main.try(:description),
      link: link,
    }.tap do |attr|
      attr[:items] = items if items.present? && items.any?
    end
  end

  def main
    parsed_rss_feed.try(:channel) || parsed_rss_feed
  end

  def title
    main.title.try(:content) || main.title
  end

  def link
    main.try(:link).try(:href) || main.try(:link)
  end

  def entries
    main.try(:items) ||
      main.try(:entries) ||
      []
  end

  def items
    main&.items&.map do |item|
      RssFeedItem.new(
        identifier: item_identifier(item),
        title: item_title(item),
        link: item_link(item),
        description: item.try(:description),
        published_at: item_published_at(item),
      )
    end
  end

  def item_identifier(item)
    identifier = item.try(:guid).try(:content) ||
                 item.try(:guid) ||
                 item.try(:id).try(:content) ||
                 item.try(:id)

    unless identifier
      raise Om::Errors::RssFeedItemIdentifierError
        .new("Could not define identifier for RssFeedItem")
    end

    identifier
  end

  def item_title(item)
    item.title.try(:content) || item.title
  end

  def item_link(item)
    item.try(:link).try(:href) || item.try(:link)
  end

  def item_published_at(item)
    item.try(:pubDate).try(:content) ||
      item.try(:pubDate) ||
      item.try(:published).try(:content) ||
      item.try(:published) ||
      item.try(:updated).try(:content) ||
      item.try(:updated) ||
      Time.current.to_s
  end
end
