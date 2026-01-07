require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TrackForge
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = ENV.fetch("TIMEZONE") { 'Central Time (US & Canada)' }
    host = ENV.fetch("HOST") { 'localhost' }
    config.action_mailer.default_url_options = { :host => host }

    # Allow Web Console
    con_host = ENV.fetch("CONSOLE_HOST") { host }
    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin' => con_host
    } 
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
