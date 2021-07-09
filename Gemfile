source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

# Core
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rails', '6.0.3'

# Middleware
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

# Frontend
gem 'coderay'
gem 'jquery-rails'
gem 'redcarpet', '~> 3.5.1'
gem 'sass-rails', '~> 5.0'
gem 'webpacker', '~> 3.5'

# Backend
gem 'carrierwave'
gem 'friendly_id', '~> 5.1.0'
gem 'jbuilder', '~> 2.5'
gem 'mini_magick', '~> 4.8'
gem 'seed-fu', '~> 2.3'
# gem 'rmagick'
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
  gem 'faker'
  gem 'guard-rspec'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-rails'
  gem 'rubocop-checkstyle_formatter'
  gem 'shoulda-matchers'
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'letter_opener_web'
  gem 'listen', '~> 3.0.5'
  gem 'rack-mini-profiler', require: false
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara'
  gem 'webdrivers'
  gem 'rails-controller-testing'
  gem 'rspec-parameterized'
  gem 'rspec-retry'
  gem 'timecop'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
