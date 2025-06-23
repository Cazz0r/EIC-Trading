require_relative 'boot'

require 'rails/all'

# Bundler is safe to call now that Rails is loaded
Bundler.require(*Rails.groups)

module EicSis
  class Application < Rails::Application
    config.load_defaults 6.1

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    config.active_storage.draw_routes = false

    if Rails.env.development?
      logger = ActiveSupport::Logger.new(STDOUT)
      logger.formatter = config.log_formatter
      config.logger = ActiveSupport::TaggedLogging.new(logger)
    end
  end
end