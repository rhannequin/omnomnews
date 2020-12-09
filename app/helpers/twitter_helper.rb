# frozen_string_literal: true

module TwitterHelper
  TWITTER_BASE_URL = "https://twitter.com"

  def twitter_account_url(username, options)
    link_to "@#{username}", "#{TWITTER_BASE_URL}/#{username}", options
  end
end
