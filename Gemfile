# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'clockwork', require: false
gem 'foreman', '~> 0.87'
gem 'hamlit', '~> 2.13'
gem 'jbuilder', '~> 2.7'
gem 'jsonapi-serializer'
gem 'pg', '~> 1.2'
gem 'puma', '~> 5.0'
gem 'rss', '~> 0.2'
gem 'sass-rails', '>= 6'
gem 'sidekiq', '~> 6.1'
gem 'turbolinks', '~> 5'
gem 'twitter', '~> 7.0'
gem 'webpacker', '~> 5.2'

group :development, :test do
  gem 'byebug', '~> 11.1'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rubocop', '~> 1.3'
  gem 'rubocop-performance', '~> 1.8'
  gem 'rubocop-rails', '~> 2.8'
  gem 'spring', '~> 2.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner', '~> 1.8'
  gem 'selenium-webdriver', '~> 3'
  gem 'webdrivers', '~> 4.4'
  gem 'webmock', '~> 3.10'
end
