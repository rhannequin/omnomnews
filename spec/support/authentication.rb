# frozen_string_literal: true

module AuthenticationRequestSupport
  PASSWORD = "password42"

  def login_as(account)
    post "/login", params: {login: account.email, password: PASSWORD}
  end
end

module AuthenticationFeatureSupport
  PASSWORD = "password42"

  def login_as(account)
    visit "/login"
    page.fill_in "Login", with: account.email
    page.fill_in "Password", with: PASSWORD
    click_on("Login")
  end
end

RSpec.configure do |config|
  config.include AuthenticationRequestSupport, type: :request
  config.include AuthenticationFeatureSupport, type: :feature
end
