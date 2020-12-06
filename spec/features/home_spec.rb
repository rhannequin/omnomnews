# frozen_string_literal: true

require "rails_helper"

feature "homepage", :twitter_fake_api, js: true do
  let!(:rss_feed_item) do
    FactoryBot.create(
      :rss_feed_item,
      published_at: Time.zone.local(2020, 12, 5),
    )
  end

  let!(:tweet) do
    FactoryBot.create(
      :tweet,
      tweeted_at: Time.zone.local(2020, 12, 4),
    )
  end

  let(:twitter_service_dbl) { double(Om::FollowTwitterUser) }
  let(:twitter_service_status) { true }

  let(:rss_feed_service_dbl) { double(Om::FollowRssFeed) }
  let(:rss_feed_service_status) { true }

  before do
    allow(Om::FollowTwitterUser).to receive(:new).and_return(twitter_service_dbl)
    allow(twitter_service_dbl).to receive(:submit).and_return(twitter_service_status)

    allow(Om::FollowRssFeed).to receive(:new).and_return(rss_feed_service_dbl)
    allow(rss_feed_service_dbl).to receive(:submit).and_return(rss_feed_service_status)
  end

  scenario "I can see the timeline" do
    visit root_path

    expect(page).to have_content("SAT DEC 05 2020")
    expect(page).to have_content(rss_feed_item.title)
    expect(page).to have_content("FRI DEC 04 2020")
    expect(page).to have_content(tweet.content)
  end

  scenario "I can add a new Twitter account" do
    visit root_path

    click_on "Add Twitter account"
    expect(page).to have_content("Add a new Twitter account")

    within ".js-twitter-modal" do
      fill_in "twitter-username", with: "dhh"
      click_on "Add"
    end

    expect(page).not_to have_content("Add a new Twitter account")
    expect(page).to(
      have_content("Twitter account successfully added, data will be synchronized soon.")
    )
  end

  scenario "I can add a new RSS feed" do
    visit root_path

    click_on "Add RSS feed"
    expect(page).to have_content("Add a new RSS feed")

    within ".js-rss-feed-modal" do
      fill_in "rss-feed-uri", with: "https://www.technologyreview.com/topnews.rss"
      click_on "Add"
    end

    expect(page).not_to have_content("Add a new RSS feed")
    expect(page).to(
      have_content("RSS feed successfully added, data will be synchronized soon.")
    )
  end

  context "when adding a Twitter account failed" do
    let(:twitter_service_status) { false }

    before do
      allow(twitter_service_dbl).to(
        receive_message_chain(:errors, :messages)
          .and_return({ username: ["Something went wrong"] })
      )
    end

    scenario "I am noticed of the errors" do
      visit root_path

      click_on "Add Twitter account"

      within ".js-twitter-modal" do
        fill_in "twitter-username", with: "dhh"
        click_on "Add"
      end

      expect(page).to have_content("Add a new Twitter account")
      expect(page).to have_content("Something went wrong")

      within ".js-twitter-modal" do
        click_on "Cancel"
      end

      expect(page).not_to have_content("Add a new Twitter account")
    end
  end

  context "when adding a RSS feed failed" do
    let(:rss_feed_service_status) { false }

    before do
      allow(rss_feed_service_dbl).to(
        receive_message_chain(:errors, :messages)
          .and_return({ uri: ["Something went wrong"] })
      )
    end

    scenario "I am noticed of the errors" do
      visit root_path

      click_on "Add RSS feed"

      within ".js-rss-feed-modal" do
        fill_in "rss-feed-uri", with: "https://www.technologyreview.com/topnews.rss"
        click_on "Add"
      end

      expect(page).to have_content("Add a new RSS feed")
      expect(page).to have_content("Something went wrong")

      within ".js-rss-feed-modal" do
        click_on "Cancel"
      end

      expect(page).not_to have_content("Add a new RSS feed")
    end
  end
end
