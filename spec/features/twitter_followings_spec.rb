# frozen_string_literal: true

require "rails_helper"

feature "homepage", :twitter_fake_api, js: true do
  let(:twitter_service_status) { true }

  before do
    allow_any_instance_of(Om::FollowTwitterUser).to(
      receive(:submit).and_return(twitter_service_status)
    )
  end

  scenario "I can add a new Twitter account" do
    login_as(FactoryBot.build(:account))

    within ".md-menu" do
      click_on I18n.t("header.twitter_following.add")
    end

    expect(page).to have_current_path new_twitter_following_path

    within ".twitter-form" do
      fill_in I18n.t("twitter_followings.new.username.name"), with: "dhh"
      click_on I18n.t("twitter_followings.new.submit")
    end

    expect(page).to have_current_path root_path
  end

  context "when adding a Twitter account failed" do
    let(:twitter_service_status) { false }
    let(:error_message) { "Something went wrong" }

    before do
      allow_any_instance_of(Om::FollowTwitterUser).to(
        receive_message_chain(:errors, :any?)
          .and_return(true)
      )
      allow_any_instance_of(Om::FollowTwitterUser).to(
        receive_message_chain(:errors, :full_messages)
          .and_return([error_message])
      )
    end

    scenario "I am noticed of the errors" do
      login_as(FactoryBot.build(:account))

      within ".md-menu" do
        click_on I18n.t("header.twitter_following.add")
      end

      expect(page).to have_current_path new_twitter_following_path

      within ".twitter-form" do
        fill_in I18n.t("twitter_followings.new.username.name"), with: "dhh"
        click_on I18n.t("twitter_followings.new.submit")
      end

      expect(page).to have_content(error_message)
    end
  end
end
