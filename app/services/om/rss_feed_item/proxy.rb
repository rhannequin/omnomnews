# frozen_string_literal: true

class Om::RssFeedItem::Proxy
  def initialize(item)
    @item = item
  end

  def attributes
    {
      identifier: identifier,
      title: title,
      link: link,
      description: description,
      published_at: published_at,
    }
  end

  private

  attr_reader :item

  def identifier
    identifier =
      item.try(:guid).try(:content) || item.try(:guid) ||
      item.try(:id).try(:content) || item.try(:id)

    unless identifier
      raise Om::Errors::RssFeedItemIdentifierError,
            "Could not define identifier for RssFeedItem"
    end

    identifier
  end

  def title
    item.title.try(:content) || item.title
  end

  def description
    item.try(:description)
  end

  def link
    item.try(:link).try(:href) || item.try(:link)
  end

  def published_at
    (
      item.try(:pubDate).try(:content) || item.try(:pubDate) ||
      item.try(:published).try(:content) || item.try(:published) ||
      item.try(:updated).try(:content) || item.try(:updated) ||
      Time.current
    ).to_s
  end
end
