Rails.application.routes.draw do
  root to: "home#index"

  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :rss_feeds, only: [:index, :show]
      resources :rss_feed_items, only: :index

      resources :twitter_followings, only: [:index]
    end
  end
end
