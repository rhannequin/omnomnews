# frozen_string_literal: true

require "rails_helper"

# rubocop:disable RSpec/MultipleExpectations
describe "homepage", js: true do
  context "when I am logged in" do
    let(:account) { FactoryBot.create(:account) }
    let(:rss_feed) { FactoryBot.create(:rss_feed, account: account) }

    let!(:rss_feed_item) do
      FactoryBot.create(
        :rss_feed_item,
        rss_feed: rss_feed,
        published_at: Time.zone.local(2020, 12, 5),
      )
    end

    let!(:tweet) do
      FactoryBot.create(:tweet, tweeted_at: Time.zone.local(2020, 12, 4))
    end

    it "I can see the timeline" do
      login_as(account)

      expect(page).to have_content("SATURDAY 05 DECEMBER")
      expect(page).to have_content(rss_feed_item.title)
      expect(page).to have_content("FRIDAY 04 DECEMBER")
      expect(page).to have_content(tweet.content)
    end
  end

  context "when I am not logged in" do
    it "I can see the timeline" do
      visit root_path

      expect(page).to have_content("You must sign in to display your followed sources.")
    end
  end
end
# rubocop:enable RSpec/MultipleExpectations
