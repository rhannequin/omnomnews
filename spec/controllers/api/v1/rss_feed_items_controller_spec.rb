# frozen_string_literal: true

require "rails_helper"

describe Api::V1::RssFeedItemsController do
  let(:rss_feed) { FactoryBot.create(:rss_feed, :with_items) }

  describe "GET #index" do
    it "is successfull" do
      get :index, params: { rss_feed_id: rss_feed.id }
      expect(response).to be_successful
    end
  end
end
