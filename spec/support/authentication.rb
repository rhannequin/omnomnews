# frozen_string_literal: true

module AuthenticationRequestSupport
  PASSWORD = "Example_123_Password"

  def created_account(email)
    post "/create-account",
         params: {
           login: email,
           "login-confirm": email,
           password: PASSWORD,
           "password-confirm": PASSWORD,
         }
  end

  def login_as(account)
    created_account(account.email)

    post "/login", params: { login: account.email, password: PASSWORD }
  end
end

module AuthenticationFeatureSupport
  PASSWORD = "Example_123_Password"

  def created_account(email)
    visit "/create-account"
    page.fill_in "Login", with: email
    page.fill_in "Confirm Login", with: email
    page.fill_in "Password", with: PASSWORD
    page.fill_in "Confirm Password", with: PASSWORD
    click_on("Create Account")
  end

  def login_as(account)
    created_account(account.email)

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
