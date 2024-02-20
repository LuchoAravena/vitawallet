source "https://rubygems.org"

ruby "3.1.0"

gem "rails", "~> 7.1.3"
gem 'pg', '~> 1.5', '>= 1.5.5'
gem "puma", ">= 5.0"
gem "bootsnap", require: false
gem 'httparty'
gem 'byebug', '~> 11.1', '>= 11.1.3'
gem 'devise', '~> 4.9', '>= 4.9.3'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
# gem "rack-cors"
gem "tzinfo-data", platforms: %i[ mswin mswin64 mingw x64_mingw jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri mswin mswin64 mingw x64_mingw ]
  gem 'rswag'
end

group :test do
  gem 'rspec-rails', '~> 6.1', '>= 6.1.1'
  gem 'factory_bot_rails', '~> 6.4', '>= 6.4.3'
  gem 'webmock', '~> 3.21', '>= 3.21.2'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem "error_highlight", ">= 0.4.0", platforms: [:ruby]
end
