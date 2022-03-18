# frozen_string_literal: true

require "rails_helper"

describe "RSS feeds", js: true do
  let(:account) { FactoryBot.create(:account) }
  let(:rss_feed) { FactoryBot.build(:rss_feed, account: account) }

  context "when adding a RSS feed succeeds" do
    include_context "when RSS feed has to be parsed"

    it "I can add a new RSS feed" do
      login_as(account)

      within ".md-menu" do
        click_on I18n.t("header.rss_feeds")
      end

      expect(page).to have_current_path rss_feeds_path

      click_on I18n.t("rss_feeds.index.actions.create")
      expect(page).to have_current_path new_rss_feed_path

      within ".rss-feed-form" do
        fill_in(
          RssFeed.human_attribute_name(:uri),
          with: rss_feed.uri
        )
        click_on I18n.t("form.submit")
      end

      expect(page).to have_current_path rss_feeds_path
      expect(page).to have_content(rss_feed.uri)

      accept_alert do
        click_on I18n.t("rss_feeds.index.actions.destroy")
      end

      expect(page).to have_current_path rss_feeds_path
      expect(page).not_to have_content(rss_feed.uri)
    end
  end

  context "when adding a RSS feed fails" do
    let(:error_message) { "Something went wrong" }

    it "I am noticed of the errors" do
      login_as(account)

      within ".md-menu" do
        click_on I18n.t("header.rss_feeds")
      end

      expect(page).to have_current_path rss_feeds_path

      click_on I18n.t("rss_feeds.index.actions.create")
      expect(page).to have_current_path new_rss_feed_path

      within ".rss-feed-form" do
        fill_in(
          RssFeed.human_attribute_name(:uri),
          with: "invalid url"
        )
        click_on I18n.t("form.submit")
      end

      expect(page).to(
        have_content(
          I18n.t("activerecord.errors.models.rss_feed.attributes.uri.invalid")
        )
      )
    end
  end
end
