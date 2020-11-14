# frozen_string_literal: true

require "rails_helper"

describe Api::V1::TwitterFollowingsController do
  describe "GET #index" do
    let!(:twitter_followings) do
      FactoryBot.create_list(:twitter_following, 2, :with_tweets)
    end

    it "is successfull" do
      get :index
      expect(response).to be_successful
    end
  end
end
