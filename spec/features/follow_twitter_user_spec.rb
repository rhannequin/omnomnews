# frozen_string_literal: true

require "rails_helper"

feature "following a Twitter user", js: true do
  it "can add a new Twitter account to follow" do
    visit root_path

    within(".js-actions") do
      click_on "Add Twitter account"
    end
    expect(page).to have_content("Add a new Twitter account")

    within(".js-add-twitter-account") do
      fill_in "twitter-username", with: "dhh"
      click_on "Add"
    end
    expect(page).not_to have_content("Add a new Twitter account")
    expect(page).to have_content(
      "Twitter account successfully added, data will be synchronized soon."
    )
  end
end
