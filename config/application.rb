require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TagNotes
  class Application < Rails::Application
    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin' => '*',
      'Access-Control-Request-Method' => %w{GET POST PUT PATCH DELETE OPTIONS}.join(",")
    }

    config.active_record.raise_in_transactional_callbacks = true
  end
end
