# frozen_string_literal: true

require "json"

module TwitterFake
  class Client
    def user_timeline(*args)
      @_user_timeline ||= UserTimeline.new.timeline
    end
  end

  class UserTimeline
    def timeline
      [Tweet.new.tweet]
    end
  end

  class Tweet
    def tweet
      OpenStruct.new(raw_data)
    end

    private

    def raw_data
      JSON.parse(fixtures)
    end

    def fixtures
      File.read(
        Rails.root.join("spec/fixtures/twitter/tweet.json")
      )
    end
  end
end
