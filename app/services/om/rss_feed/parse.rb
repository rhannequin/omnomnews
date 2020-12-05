# frozen_string_literal: true

require "rss"
require "open-uri"

class Om::RssFeed::Parse
  KNOWN_ERRORS = [
    RSS::MissingTagError,
  ].freeze

  def initialize(uri)
    @uri = uri
    super()
  end

  def parse
    rss = URI.parse(uri).open
    RSS::Parser.parse(rss)
  rescue *KNOWN_ERRORS => e
    raise Om::Errors::RssFeedParsingError, e.message
  end

  private

  attr_reader :uri
end
