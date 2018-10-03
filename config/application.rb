require_relative "boot"
require "rails/all"
Bundler.require(*Rails.groups)

module Project
  class Application < Rails::Application
    config.load_defaults 5.2
    console do
      require "pry"
      config.console = Pry
    end
  end
end
