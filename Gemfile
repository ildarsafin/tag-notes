source 'https://rubygems.org'

gem 'rails', '4.2.1'

gem 'rails-api'

gem 'pg'
gem 'devise'
gem 'active_model_serializers', github: 'rails-api/active_model_serializers'
gem 'rack-cors', require: 'rack/cors'

group :development do
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "bundler-audit", require: false
  gem "byebug"
  gem "rspec_api_documentation"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-rails"
  gem 'rspec-rails', '~> 3.2.1'
end

group :test do
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers", require: false
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end
