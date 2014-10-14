source 'https://rubygems.org'
ruby "1.9.3"
gem 'rails', '3.2.12'
gem 'bootstrap-sass', '2.3.1.0'

# gem for uploading files (images). 
gem 'carrierwave'
# gem for storing files on Amazon S3
gem 'fog'
# gem for retrieving geographical coordinates
gem 'geocoder'
# gem for table-less models
gem 'active_attr'
# gem for parsing HTML, XML, etc.
gem 'nokogiri'
# gem for string sanitization
gem 'sanitize'
# gem for profanity filtering
gem 'obscenity'
# gem for rich text editing
gem 'tinymce-rails'
# gem for image processing and scaling
gem "rmagick", :require => 'RMagick'

# gem injected with Heroku, so I just added it - Neil
gem 'rails_12factor'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# gem 'sqlite3'

# gem for interfacing with PostGreSQL database
gem 'pg'

# gem for validating dates
gem 'validates_timeliness', '~> 3.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.1'

# Used for endless scrolling
gem 'kaminari'

# Used for vertical allignment
# also contains sausage which is used for infinite scrolling
gem 'masonry-rails'


# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :development, :test do
	# gem that provides a testing framework
	gem 'rspec-rails'
	# gem for integration testing
	gem 'capybara'
	# gem for code coverage analysis
	gem 'simplecov'
end

# gem to support automated testing
# last working driver is 2.30.0, updating to the latest
gem "selenium-webdriver", "~> 2.42.0"
