source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.8'

gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'pg'
gem 'puma', '~> 5.0'
# gem 'jbuilder', '~> 2.7'

gem 'bootsnap', '>= 1.4.4', require: false

gem 'rack-cors'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem "omniauth-rails_csrf_protection"
gem 'dotenv-rails'
gem "sd_notify"

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 5.0.0'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem "capistrano", "~> 3.16", require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
