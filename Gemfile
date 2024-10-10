# frozen_string_literal: true

source "https://rubygems.org"

gem "bootsnap", "~> 1.18", require: false
gem "pg", "~> 1.5"
gem "puma", ">= 6.4"
gem "rails", "~> 7.2"
gem "redis", "~> 5.3"
gem "sidekiq", "~> 7.3"
gem "tzinfo-data", "~> 1.2024", platforms: %i[windows jruby]

group :development do
  gem "rubocop", "~> 1.66", require: false
  gem "rubocop-factory_bot", "~> 2.26", require: false
  gem "rubocop-minitest", "~> 0.36", require: false
  gem "rubocop-performance", "~> 1.22", require: false
  gem "rubocop-rails", "~> 2.26", require: false
  gem "rubocop-rake", "~> 0.6", require: false
  gem "rubocop-thread_safety", "~> 0.5", require: false
end

group :development, :test do
  gem "brakeman", "~> 6.2", require: false
  gem "debug", "~> 1.9", platforms: %i[mri windows], require: "debug/prelude"
  gem "factory_bot_rails", "~> 6.4"
end
