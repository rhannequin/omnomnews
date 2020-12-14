# frozen_string_literal: true

require "rails_helper"

# rubocop:disable RSpec/MultipleExpectations
describe "homepage", js: true do
  let!(:rss_feed_item) do
    FactoryBot.create(
      :rss_feed_item,
      published_at: Time.zone.local(2020, 12, 5),
    )
  end

  let!(:tweet) do
    FactoryBot.create(:tweet, tweeted_at: Time.zone.local(2020, 12, 4))
  end

  it "I can see the timeline" do
    visit root_path

    expect(page).to have_content("SATURDAY 05 DECEMBER")
    expect(page).to have_content(rss_feed_item.title)
    expect(page).to have_content("FRIDAY 04 DECEMBER")
    expect(page).to have_content(tweet.content)
  end
end
# rubocop:enable RSpec/MultipleExpectations
