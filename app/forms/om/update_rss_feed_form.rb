# frozen_string_literal: true

class Om::UpdateRssFeedForm < Om::Form
  attribute :rss_feed_id, :integer
  attribute :uri, :string

  validates_presence_of :uri

  def perform
    service = Om::RssFeed::Update.new(rss_feed_id: rss_feed_id, uri: uri)
    return true if service.perform

    service.errors.each do |error|
      errors.add(:base, error)
    end
    false
  end
end
