# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"
gem "rails", "~> 7.0.2"

gem "acts-as-taggable-on", "~> 9.0"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.4.4", require: false
gem "cssbundling-rails", ">= 0.1.0"
gem "foreman", "~> 0.87"
gem "hamlit", "~> 2.13"
gem "jbuilder", "~> 2.7"
gem "jsbundling-rails", "~> 1.0.0"
gem "pg", "~> 1.3"
gem "puma", "~> 5.6"
gem "redis", "~> 4.0"
gem "rodauth-rails", "~> 1.3.1"
gem "rss", "~> 0.2"
gem "sidekiq", "~> 6.4"
gem "sprockets-rails", "~> 3.4.0", require: "sprockets/railtie"
gem "stimulus-rails", ">= 0.4.0"
gem "turbo-rails", ">= 0.7.11"
gem "twitter", "~> 7.0"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "standard"
end

group :development do
  gem "brakeman"
  gem "prettier"
  gem "web-console", ">= 4.1.0"
end

group :test do
  gem "capybara", "~> 3.36"
  gem "database_cleaner", "~> 1.8"
  gem "selenium-webdriver", "~> 4"
  gem "simplecov", "~> 0.19", require: false
  gem "webdrivers", "~> 5.0"
  gem "webmock", "~> 3.10"
end
