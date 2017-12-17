source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Core
gem 'rails', '~> 5.1.4'

# Model/DB
gem 'pg', '~> 0.18'
gem 'devise'

# View
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem "font-awesome-rails"
gem "redcarpet"
gem "rouge"

# Middleware
gem 'puma', '~> 3.7'

# API
gem 'slack-incoming-webhooks'

# Configure
gem 'dotenv-rails'

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rack-mini-profiler'
  gem 'letter_opener'
  gem 'binding_of_caller'
  gem 'better_errors'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'factory_bot_rails'
end

group :test do
  gem 'rspec-rails'
  gem 'database_cleaner'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
