# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    sequence(:email) { |n| "hello-#{n}@email.com" }
    status { :verified }

    after(:create) do |account|
      account.create_account_password_hash!(
        password_hash: BCrypt::Password.create("password42")
      )
    end
  end
end
