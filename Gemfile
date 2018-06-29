source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'


group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'rails-controller-testing'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem "factory_bot_rails"
  gem 'pundit-matchers', '~> 1.4.1'
  gem 'listen'
  gem 'sqlite3'
end

group :production do
   gem 'pg'
   gem 'rails_12factor'
 end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap-sass'
gem 'devise'
gem 'faker'
gem 'figaro', '1.0'
gem 'simplecov', require: false, group: :test
gem 'pundit'
gem 'stripe'
gem 'redcarpet'
gem 'kaminari'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
