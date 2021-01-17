# frozen_string_literal: true

require "rails_helper"

# rubocop:disable RSpec/ExampleLength
# rubocop:disable RSpec/MultipleExpectations
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
          with: rss_feed.uri,
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

    before do
      # rubocop:disable RSpec/AnyInstance
      allow_any_instance_of(Om::FollowRssFeedForm).to(
        receive(:submit).and_return(false),
      )
      # rubocop:enable RSpec/AnyInstance

      # rubocop:disable RSpec/AnyInstance
      # rubocop:disable RSpec/MessageChain
      allow_any_instance_of(Om::FollowRssFeedForm).to(
        receive_message_chain(:errors, :any?).and_return(true),
      )
      allow_any_instance_of(Om::FollowRssFeedForm).to(
        receive_message_chain(:errors, :full_messages).and_return(
          [error_message],
        ),
      )
      # rubocop:enable RSpec/AnyInstance
      # rubocop:enable RSpec/MessageChain
    end

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
          with: FactoryBot.build(:rss_feed).uri,
        )
        click_on I18n.t("form.submit")
      end

      expect(page).to have_content(error_message)
    end
  end
end
# rubocop:enable RSpec/ExampleLength
# rubocop:enable RSpec/MultipleExpectations
