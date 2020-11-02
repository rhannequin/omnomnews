# frozen_string_literal: true

class Om::RssFeed::Create < Om::Service
  def initialize(uri)
    @uri = uri
    super()
  end

  perform do
    create_rss_feed!
  end

  private

  attr_reader :uri

  def create_rss_feed!
    RssFeed.create!(uri: uri)
  end
end
