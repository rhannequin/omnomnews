# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    sequence(:email) { |n| "hello-#{n}@email.com" }
    status { :verified }
  end
end
