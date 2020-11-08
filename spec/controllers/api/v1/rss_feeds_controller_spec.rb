# frozen_string_literal: true

require "rails_helper"

describe Api::V1::RssFeedsController do
  describe "GET #index" do
    let!(:rss_feeds) { FactoryBot.create_list(:rss_feed, 2) }

    it "is successfull" do
      get :index
      expect(response).to be_successful
    end
  end
end
