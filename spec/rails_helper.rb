ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require "shoulda/matchers"

Dir[Rails.root.join("spec/support/**/*.rb"), Rails.root.join("spec/helpers/**/*.rb")].each { |file| require file }

RSpec.configure do |config|
  config.include Requests::JsonHelpers, type: :request

  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false
end

ActiveRecord::Migration.maintain_test_schema!
