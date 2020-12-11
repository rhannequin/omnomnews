# frozen_string_literal: true

require "rails_helper"

describe Api::V1::GroupedElementsController, type: :request do
  describe "GET #index" do
    let(:subject) do
      get api_v1_grouped_elements_path, params: { format: :json }
    end

    let!(:twitter_followings) { FactoryBot.create_list(:twitter_following, 2, :with_tweets) }
    let!(:rss_feed_items) { FactoryBot.create_list(:rss_feed_item, 2) }

    it "is successfull" do
      subject
      expect(response).to be_successful
    end

    context "when there is no existing data" do
      let!(:twitter_followings) { [] }
      let!(:rss_feeds) { [] }

      it "is successfull" do
        subject
        expect(response).to be_successful
      end
    end
  end
end
