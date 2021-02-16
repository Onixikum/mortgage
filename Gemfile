source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '6.1.2.1'
gem 'pg', '1.2.3'
gem 'puma', '5.2.1'
gem 'sass-rails', '6.0.0'
gem 'webpacker', '5.2.1'
gem 'turbolinks', '5.2.1'
gem 'jbuilder', '2.11.2'
gem 'bootsnap', '1.7.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '4.1.0'
  gem 'listen', '3.4.1'
  gem 'spring'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  gem 'capybara', '3.35.3'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
