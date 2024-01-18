require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MovieApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.stripe_publishable_key = 'pk_test_51ORUrUSIVXA0jOhGvmnewAzuGnosbRhtEGghNPcKAIUVITDodbYqYd9yjybqm6LtgQbO6ctzDIrSF79zQzLa3BcI00uSfeYBFz'
    config.stripe_secret_key = 'sk_test_51ORUrUSIVXA0jOhG6s0Xm3zD5R0ijb6HM3uWts5WkWVRR1nNXlpV5kxtcjilkUwQpX5T1O9T79o6xgJ2KMh4KOkA00Bj4W2Crp'
  end
end
