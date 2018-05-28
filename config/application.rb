require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Keijiban
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.time_zone = 'Asia/Tokyo'
    config.i18n.default_locale = :ja

    config.generators do |g|
      g.test_framework       :rspec, view_specs: false, helper_specs: false, fixture: true
      g.helper               false
      g.stylesheets          false
      g.javascripts          false
      g.fixture_replacement  :factory_bot, dir: "spec/factories"
      g.system_tests         false
    end
  end
end
