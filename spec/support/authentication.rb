# frozen_string_literal: true

module AuthenticationSupport
  PASSWORD = "Example_123_Password"

  def created_account(email)
    post "/create-account", params: {
      login: email,
      "login-confirm": email,
      password: PASSWORD,
      "password-confirm": PASSWORD,
    }
  end

  def login_as(account)
    created_account(account.email)

    post "/login", params: {
      login: account.email,
      password: PASSWORD,
    }
  end

  def logout
    post "/logout"
  end
end

RSpec.configure do |config|
  config.include AuthenticationSupport, type: :request
end
