source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'aasm'

gem 'bcrypt'
gem 'bootstrap-sass'

gem 'carrierwave'
gem 'coffee-rails', '~> 4.2'

gem 'faker'

gem 'email_validator'

gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'

gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'pundit'

gem 'rails', '~> 5.1.2'
gem 'rails-i18n'

gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'slim-rails'

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'uglifier', '>= 1.3.0'

gem 'warden'

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'

  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'web-console', '>= 3.3.0'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'pry-byebug'
  gem 'pry-rails'
end

group :test do
  gem 'capybara'
  gem 'rails-controller-testing'

  gem 'database_cleaner'

  gem 'factory_girl_rails'
  gem 'fuubar'

  gem 'poltergeist'

  gem 'rspec-rails'

  gem 'simplecov'
  gem 'shoulda-matchers'
end
