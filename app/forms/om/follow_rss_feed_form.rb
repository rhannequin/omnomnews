# frozen_string_literal: true

class Om::FollowRssFeedForm < Om::Form
  attribute :uri, :string

  validates_presence_of :uri

  def perform
    service = Om::RssFeed::Create.new(uri)
    return true if service.perform

    service.errors.each do |error|
      errors.add(:base, error)
    end
    false
  end
end
