# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"

gem 'rubyweekly_scrapper', github: 'ilnurnasyrov/rubyweekly_scrapper'

gem 'concurrent-ruby', require: 'concurrent'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  # gem 'quiet_assets'

  gem 'pry'
  gem 'pry-byebug'
end
