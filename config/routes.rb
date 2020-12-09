# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#index"

  get "/monolith", to: "home#monolith"

  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :grouped_elements, only: :index
      resources :twitter_followings, only: :create
      resources :rss_feeds, only: :create
    end
  end
end
