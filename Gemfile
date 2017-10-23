source 'https://rubygems.org'

# Specify ruby version for heroku
ruby '2.4.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1.4'

# Use sqlite3 as the database for Active Record
group :development,:test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'json', github: 'flori/json', branch: 'v1.8'  # json gem doesn't work right w/ ruby 2.4.1 so use this version
  gem 'pry-rails'
  gem "rspec-its"
  gem 'rspec-rails', '~> 3.0'
  gem "shoulda-matchers"
  gem 'sqlite3'
  gem 'listen'
end

group :production do
  gem 'pg'
  gem 'rails_12factor' # need this for asset compilation on heroku
  gem 'unicorn'
end

group :development do
  gem "web-console", "~> 2.0"
end

group :test do
  gem 'rails-controller-testing'
end

# Use SCSS for stylesheets
gem 'sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem "turbolinks"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'nokogiri'
gem "geocoder"
gem "rails_autolink"
gem "haml"
gem "simple_form"
gem "figaro"
gem "activeadmin"
gem "devise"
gem "actionpack"
gem "activemodel"
gem "activesupport"
gem "railties"

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
