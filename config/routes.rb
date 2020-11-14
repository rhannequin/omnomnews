Rails.application.routes.draw do
  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :rss_feeds, only: [:index] do
        resources :rss_feed_items, path: :items, only: [:index]
      end

      resources :twitter_followings, only: [:index]
    end
  end
end
