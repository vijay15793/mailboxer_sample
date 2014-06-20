source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'sqlite3', group: :development
gem 'pg', group: :production
gem 'sass-rails',   '~> 3.2.3'

group :assets do
  
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'foundation-rails'
gem 'cancan'
gem 'devise'
gem 'figaro'
gem 'rolify'
gem 'simple_form'
gem "select2-rails"
gem 'rails-ajax'
group :development do
  gem 'rails_layout'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'#, :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'quiet_assets'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails', :require=>false
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'launchy'
end

gem 'rails_12factor', group: :production

#gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS

# Gems used only for assets and not required
# in production environments by default.

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
