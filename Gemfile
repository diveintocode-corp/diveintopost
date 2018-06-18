source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Core
gem 'rails', '~> 5.2.0'
gem 'bootsnap', '>= 1.1.0', require: false

# Middleware
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

# Frontend
gem 'sass-rails', '~> 5.0'
gem 'webpacker', '~> 3.5'
gem 'redcarpet', '~> 2.3.0'
gem 'coderay'

# Backend
gem 'jbuilder', '~> 2.5'
gem 'mini_magick', '~> 4.8'
# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'

# Authentication
gem 'devise'

group :development, :test do
  gem 'awesome_print'
  gem 'bullet'
  gem 'byebug', platform: :mri
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'guard-rspec'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'shoulda-matchers'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'faker'
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'web-console', '>= 3.3.0'
  gem 'letter_opener'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'rack-mini-profiler', require: false
end

group :test do
  gem 'rails-controller-testing'
  gem 'timecop'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'rspec-retry'
  gem 'rspec-parameterized'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
