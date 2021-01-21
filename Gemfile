# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.0'
gem 'redis', '~> 4.0'
gem 'slim-rails'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'awesome_print'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
end

group :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'fuubar'
  gem 'shoulda-matchers'
  gem 'simplecov'
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman'
  gem 'bundle-audit'
  gem 'foreman'
  gem 'letter_opener'
  gem 'listen', '~> 3.3'
  gem 'ordinare', require: false
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

# gem "hotwire-rails", "~> 0.1.2"
gem 'acts_as_list'
gem 'turbo-rails'
