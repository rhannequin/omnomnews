# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#index"

  resources :twitter_followings, only: %i[index new create destroy]
  resources :rss_feeds, only: %i[index new create destroy]
end
