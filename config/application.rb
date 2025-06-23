require_relative 'boot'

require 'rails/all'

# Bundler is safe to call now that Rails is loaded
Bundler.require(*Rails.groups)

# if defined?(Rails) && (Rails.env == 'development')
#   Rails.logger = Logger.new(STDOUT)
# end

# if defined?(Rails) && Rails.env.development?
#   Rails.logger = ActiveSupport::Logger.new(STDOUT)
# end

# if defined?(Rails) && Rails.env.development?
#   logger = ActiveSupport::Logger.new(STDOUT)
#   logger.formatter = Rails.application.config.log_formatter
#   Rails.logger = ActiveSupport::TaggedLogging.new(logger)
# end

module EicSis
  class Application < Rails::Application
    config.load_defaults 6.1

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    if Rails.env.development?
      logger = ActiveSupport::Logger.new(STDOUT)
      logger.formatter = config.log_formatter
      config.logger = ActiveSupport::TaggedLogging.new(logger)
    end
  end
end