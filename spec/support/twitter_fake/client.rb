# frozen_string_literal: true

require "json"

module TwitterFake
  class Client
    def status(*args)
      @_status ||= Tweet.new.tweet
    end

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
      JSON.parse(fixtures, object_class: OpenStruct)
    end

    private

    def fixtures
      File.read(
        Rails.root.join("spec/fixtures/twitter/tweet.json")
      )
    end
  end
end
