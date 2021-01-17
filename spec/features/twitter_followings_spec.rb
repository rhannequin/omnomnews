# frozen_string_literal: true

require "rails_helper"

# rubocop:disable RSpec/ExampleLength
# rubocop:disable RSpec/MultipleExpectations
describe "Twitter accounts", :twitter_fake_api, js: true do
  let(:account) { FactoryBot.create(:account) }
  let(:twitter_following) { FactoryBot.build(:twitter_following) }

  context "when adding a Twitter account succeeds" do
    it "I can add a new Twitter account" do
      login_as(account)

      within ".md-menu" do
        click_on I18n.t("header.twitter_followings")
      end

      expect(page).to have_current_path twitter_followings_path

      click_on I18n.t("twitter_followings.index.actions.create")
      expect(page).to have_current_path new_twitter_following_path

      within ".twitter-form" do
        fill_in(
          TwitterFollowing.human_attribute_name(:username),
          with: twitter_following.username,
        )
        click_on I18n.t("form.submit")
      end

      expect(page).to have_current_path twitter_followings_path
      expect(page).to have_content(twitter_following.username)

      accept_alert do
        click_on I18n.t("twitter_followings.index.actions.destroy")
      end

      expect(page).to have_current_path twitter_followings_path
      expect(page).not_to have_content(twitter_following.username)
    end
  end

  context "when adding a Twitter account fails" do
    let(:error_message) { "Something went wrong" }

    before do
      # rubocop:disable RSpec/AnyInstance
      allow_any_instance_of(Om::FollowTwitterUserForm).to(
        receive(:submit).and_return(false),
      )
      # rubocop:enable RSpec/AnyInstance

      # rubocop:disable RSpec/AnyInstance
      # rubocop:disable RSpec/MessageChain
      allow_any_instance_of(Om::FollowTwitterUserForm).to(
        receive_message_chain(:errors, :any?).and_return(true),
      )
      allow_any_instance_of(Om::FollowTwitterUserForm).to(
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
        click_on I18n.t("header.twitter_followings")
      end

      expect(page).to have_current_path twitter_followings_path

      click_on I18n.t("twitter_followings.index.actions.create")
      expect(page).to have_current_path new_twitter_following_path

      within ".twitter-form" do
        fill_in(
          TwitterFollowing.human_attribute_name(:username),
          with: FactoryBot.build(:twitter_following).username,
        )
        click_on I18n.t("form.submit")
      end

      expect(page).to have_content(error_message)
    end
  end
end
# rubocop:enable RSpec/ExampleLength
# rubocop:enable RSpec/MultipleExpectations
