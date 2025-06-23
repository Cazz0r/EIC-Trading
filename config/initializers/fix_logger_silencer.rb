# Safely remove @@silencer only if it exists and isn't already removed
# begin
#   if defined?(ActiveSupport::Logger) && ActiveSupport::Logger.class_variable_defined?(:@@silencer)
#     ActiveSupport::Logger.remove_class_variable(:@@silencer)
#   end
# rescue NameError => e
#   Rails.logger.warn("Failed to remove @@silencer: #{e.message}") if defined?(Rails)
# end