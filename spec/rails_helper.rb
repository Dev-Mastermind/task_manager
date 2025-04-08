require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

# Uncomment if you have support files (custom matchers, macros, etc.)
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

# Maintain test schema
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  # FactoryBot
  config.include FactoryBot::Syntax::Methods

  # Fixture path
  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]

  # Turn OFF Rails' built-in transaction fixtures (we use DatabaseCleaner instead)
  config.use_transactional_fixtures = false

  # Automatically infer test type from file location (e.g. controllers, requests, etc.)
  config.infer_spec_type_from_file_location!

  # Clean backtrace
  config.filter_rails_from_backtrace!

  # DatabaseCleaner setup
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
