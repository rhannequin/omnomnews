require "clockwork"
require "active_support/time"
require "./config/boot"
require "./config/environment"

module Clockwork
  configure do |config|
    config[:tz] = "UTC"
    config[:logger] = Rails.logger
  end

  handler { |job, time| "#{job}".constantize.perform_later }

  every(1.day, "Om::SyncAllSourcesJob")
end
