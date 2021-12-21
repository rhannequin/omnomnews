# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"
gem "rails", "~> 7.0.0"

gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.4.4", require: false
gem "cssbundling-rails", ">= 0.1.0"
gem "foreman", "~> 0.87"
gem "hamlit", "~> 2.13"
gem "jbuilder", "~> 2.7"
gem "jsbundling-rails", "~> 0.1.0"
gem "pg", "~> 1.2"
gem "puma", "~> 5.0"
gem "redis", "~> 4.0"
gem "rodauth-rails", "~> 0.18.1"
gem "rss", "~> 0.2"
gem "sidekiq", "~> 6.1"
gem "sprockets-rails", "~> 3.4.0", require: "sprockets/railtie"
gem "stimulus-rails", ">= 0.4.0"
gem "turbo-rails", ">= 0.7.11"
gem "twitter", "~> 7.0"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "rspec-rails"
end

group :development do
  gem "brakeman"
  gem "database_consistency", require: false
  gem "prettier"
  gem "rubocop", "1.22.0"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "rubocop-rspec"
  gem "web-console", ">= 4.1.0"
end

group :test do
  gem "capybara", "~> 3.36"
  gem "database_cleaner", "~> 1.8"
  gem "selenium-webdriver", "~> 4"
  gem "simplecov", "~> 0.19", require: false
  gem "webdrivers", "~> 4.4"
  gem "webmock", "~> 3.10"
end
