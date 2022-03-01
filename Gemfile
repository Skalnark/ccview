source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0'
# i18n For 5.0.x, 5.1.x and 5.2.x
gem 'rails-i18n', '~> 5.1' 
# Bundler
gem 'bundler', '>= 1.8.4'
# Flexible authentication solution for Rails with Warden
gem 'devise'
# Translations for the devise gem
gem 'devise-i18n'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
# Ruby on Rails unobtrusive scripting adapter for jQuery 
gem 'jquery-rails'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Active Storage Amazon S3 gem.
gem "aws-sdk-s3", require: false
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
gem 'mini_magick', '~> 4.8'
# A session store backed by an Active Record class
gem 'activerecord-session_store'

# Whenever is a Ruby gem that provides a clear syntax for writing and deploying cron jobs
gem 'whenever', require: false

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# High-level image processing helper methods with libvips and ImageMagick/GraphicsMagick
gem 'image_processing', '~> 1.12'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rails-erd'
  # Use sqlite3 as the database for Active Record
  gem "sqlite3", "~> 1.3.6"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano', '>= 3.2.1'
  gem 'capistrano-rvm'
  gem "capistrano3-unicorn" 
  gem 'capistrano-bundler', '~> 1.1.2'       # support for bundler
  gem 'capistrano-rails', '~> 1.0'           # automatic migrations and asset compilation
  gem 'capistrano-unicorn-nginx', '~> 2.0'   # plug-n-play nginx and unicorn
  gem 'capistrano-postgresql', '~> 3.0'      # plug-n-play postgresql
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

group :production do
  gem 'unicorn'
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
