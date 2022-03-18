# frozen_string_literal: true

require "uri"

class Om::FollowRssFeedForm < Om::Form
  attribute :account_id, :integer
  attribute :uri, :string

  validates_presence_of :uri

  validate :valid_url

  def perform
    service = Om::RssFeed::Create.new(account_id, uri)
    return true if service.perform

    service.errors.each do |error|
      errors.add(:base, error)
    end
    false
  end

  private

  def valid_url
    unless uri&.match?(URI::DEFAULT_PARSER.make_regexp)
      errors.add(
        :uri,
        I18n.t("activerecord.errors.models.rss_feed.attributes.uri.invalid")
      )
    end
  end
end
