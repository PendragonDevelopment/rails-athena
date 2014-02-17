source 'https://rubygems.org'
ruby '1.9.3'
gem 'rails', "~> 3.2.16"
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails'
  gem 'font-awesome-rails'
  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'bootstrap-sass'
gem 'cancan'
gem 'devise',           '~> 2.2.0'
gem 'devise_invitable', '~> 1.1.0'
gem 'gravatar_image_tag'
gem 'figaro'
gem 'rolify'
gem 'simple_form'
gem 'thin'

# Twelve Factor gem
gem 'rails_12factor', group: :production

# Nested form support
gem "nested_form"

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'sqlite3'
end
group :production do
  gem 'pg'
end
group :test do
  gem 'capybara'
  gem 'cucumber-rails', :require=>false
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'launchy'
end

# Strong parameters
gem "strong_parameters"

# Model annotation
gem "annotate"

# Slugify models
gem "stringex"
gem "friendly_id", "~> 4.0.10"

# Paperclip
gem "paperclip"
gem 'aws-sdk', '~> 1.5.7'

# Pry for debugging
gem 'pry'

# bootstrap-datepicker
gem 'bootstrap-datepicker-rails'

# Email preview in the browser
gem "letter_opener", :group => :development

# Static pages
gem 'high_voltage', '~> 2.1.0'