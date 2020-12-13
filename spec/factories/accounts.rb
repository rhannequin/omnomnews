# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    email { "hello@rhannequ.in" }
    status { :verified }
  end
end
