source 'https://rubygems.org'
ruby '2.5.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use sqlite3 as the database for Active Record
gem 'pg'
gem "rolify"
# Use Puma as the app server
gem 'puma'
gem 'bcrypt'
gem 'jwt'
gem 'active_model_serializers'
gem 'aasm'
gem 'rack-cors', require: 'rack/cors'
gem 'annotate'
gem 'unicorn'
gem "sentry-raven"
gem 'pry'
gem 'aws'
gem 'spreadsheet'


# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'capistrano', '~> 3.11'
  gem 'capistrano-rbenv', '~> 2.1', '>= 2.1.4', require: false
  gem 'capistrano-bundler', '~> 1.5', require: false
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano3-puma', github: "seuros/capistrano-puma"
  gem 'capistrano3-nginx', '~> 3.0', '>= 3.0.1', require: false
  gem 'capistrano-sidekiq', '~> 1.0', '>= 1.0.2', require: false
  gem 'capistrano-rails-console', '~> 2.3', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
