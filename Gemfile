source 'http://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
ruby "2.3.1p112"


source 'https://rails-assets.org' do
  # Bootstrap
  gem 'rails-assets-bootstrap', '3.3.7'
  # Animate CSS
  gem 'rails-assets-animate-css'
  # Bootstrap Mardown
  gem 'rails-assets-bootstrap-markdown'
  # Marked
  gem 'rails-assets-marked'
  # Bootstrap Notify
  gem 'rails-assets-bootstrap.growl'
  # Animate CSS
  gem 'rails-assets-animate-css'
  # bootboxjs
  gem 'rails-assets-bootbox', ' 4.4.0'
end
# jQuery UI for the Rails asset pipeline
gem 'jquery-ui-rails'
gem 'jquery-inputmask-rails'
gem 'jquery-rails'

# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use postgrees as the database for Active Record
gem 'pg', '0.21.0'
gem "mechanize"
# A library for generating fake data such as names, addresses, and phone numbers.
gem 'faker'
# Cloudinary GEM for Ruby on Rails integration
gem 'cloudinary'
gem "nokogiri"
gem "attr_encrypted", "3.1.0"
gem 'kaminari'
gem 'sass-rails', '~> 5.0'
gem 'font-awesome-rails'
# Solution for file uploads for Rails
gem 'carrierwave', '1.2.2'
gem 'carrierwave-i18n'
gem 'mini_magick'
gem 'mail'
# Flexible authentication solution for Rails with Warden.
gem 'devise'
gem 'devise-i18n'
# Rails gem of the Bootstrap based admin theme SB Admin 2.
gem 'bootstrap_sb_admin_base_v2'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
#gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Help ActiveRecord::Enum feature to work fine with I18n and simple_form.
gem 'enum_help'
# Minimal authorization through OO design and pure Ruby classes
gem 'pundit'
# Trabalhos assincronos (https://github.com/mperham/sidekiq)
gem 'sidekiq', '5.1.3'
# Scheduler for Ruby (at, in, cron and every jobs)
gem 'sidekiq-cron', '1.0.4'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'rails_12factor', group: :production

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  # load environment variables from .env into ENV in development.
  gem 'dotenv-rails'
end

group :development do
  # Access an IRB console on exception page or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
