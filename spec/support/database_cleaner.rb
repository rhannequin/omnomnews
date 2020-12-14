# frozen_string_literal: true

RSpec.configure do |config|
  config.use_transactional_fixtures = true

  config.before(:suite) { DatabaseCleaner.clean_with(:deletion) }

  config.before { DatabaseCleaner.strategy = :transaction }

  config.before(:each, non_transactional: true) do
    DatabaseCleaner.strategy = :deletion
  end

  config.before(:each, js: true) { DatabaseCleaner.strategy = :truncation }

  config.before { DatabaseCleaner.start }

  config.after { DatabaseCleaner.clean }
end
