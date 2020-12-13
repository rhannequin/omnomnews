# frozen_string_literal: true

require "rails_helper"

feature "RSS feeds", js: true do
  let(:rss_feed_service_status) { true }

  before do
    allow_any_instance_of(Om::FollowRssFeed).to(
      receive(:submit).and_return(rss_feed_service_status)
    )
  end

  scenario "I can add a new RSS feed" do
    login_as(FactoryBot.build(:account))

    within ".md-menu" do
      click_on I18n.t("header.rss_feed.add")
    end

    expect(page).to have_current_path new_rss_feed_path

    within ".rss-feed-form" do
      fill_in(
        I18n.t("rss_feeds.new.uri.name"),
        with: FactoryBot.build(:rss_feed).uri,
      )
      click_on I18n.t("rss_feeds.new.submit")
    end

    expect(page).to have_current_path root_path
  end

  context "when adding a RSS feed failed" do
    let(:rss_feed_service_status) { false }
    let(:error_message) { "Something went wrong" }

    before do
      allow_any_instance_of(Om::FollowRssFeed).to(
        receive_message_chain(:errors, :any?)
          .and_return(true)
      )
      allow_any_instance_of(Om::FollowRssFeed).to(
        receive_message_chain(:errors, :full_messages)
          .and_return([error_message])
      )
    end

    scenario "I am noticed of the errors" do
      login_as(FactoryBot.build(:account))

      within ".md-menu" do
        click_on I18n.t("header.rss_feed.add")
      end

      expect(page).to have_current_path new_rss_feed_path

      within ".rss-feed-form" do
        fill_in(
          I18n.t("rss_feeds.new.uri.name"),
          with: FactoryBot.build(:rss_feed).uri,
        )
        click_on I18n.t("rss_feeds.new.submit")
      end

      expect(page).to have_content(error_message)
    end
  end
end
