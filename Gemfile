# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'
gem 'rails', '~> 6.1'

gem 'bcrypt', '~> 3.1'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'foreman', '~> 0.87'
gem 'hamlit', '~> 2.13'
gem 'jbuilder', '~> 2.7'
gem 'pg', '~> 1.2'
gem 'puma', '~> 5.0'
gem "rodauth-rails", "~> 0.7.0"
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
  gem 'brakeman'
  gem 'database_consistency', require: false
  gem 'listen', '~> 3.3'
  gem 'prettier'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'spring', '~> 2.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner', '~> 1.8'
  gem 'selenium-webdriver', '~> 3'
  gem 'simplecov', '~> 0.19', require: false
  gem 'webdrivers', '~> 4.4'
  gem 'webmock', '~> 3.10'
end
