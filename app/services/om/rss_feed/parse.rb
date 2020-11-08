# frozen_string_literal: true

require "rss"
require "open-uri"

class Om::RssFeed::Parse
  def initialize(uri)
    @uri = uri
    super()
  end

  def parse
    rss = URI.parse(uri).open
    RSS::Parser.parse(rss)
  end

  private

  attr_reader :uri
end
