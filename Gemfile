source 'https://rubygems.org'

# Specify ruby version for heroku
ruby '2.6.6'

gem 'rails', '5.2.4.4'

# Use sqlite3 as the database for Active Record
group :development,:test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'json'
  gem 'pry-rails'
  gem 'rspec-its'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor' # need this for asset compilation on heroku
  gem 'unicorn'
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
gem 'turbolinks', '~> 2.5.3'


group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'nokogiri', '>= 1.10.4'
gem 'geocoder'
gem 'rails_autolink'
gem 'figaro'
gem 'simple_form'
gem 'devise'
gem 'rails-controller-testing'


# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
