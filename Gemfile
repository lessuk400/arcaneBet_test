source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby ENV.fetch('CIRCLE_CI_RUBY_VERSION', '2.5.0')

gem 'rails', '~> 5.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'falcon'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'haml-rails', '~> 1.0'
gem 'devise'
gem 'sprockets', '>= 4.0.0.beta8'
gem 'simple_form'
gem 'chartkick'
gem 'pagy'
gem 'draper'
gem 'rails-routes'

group :development, :test do
  gem 'brakeman', require: false
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'dotenv-rails'
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'factory_bot_rails'
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'capybara-screenshot'
  gem 'faker'
  gem 'rubocop'
end

gem 'tzinfo-data'
