require_relative "boot"
require "rails/all"
# require "csv"
Bundler.require(*Rails.groups)

module Project
  class Application < Rails::Application
    config.load_defaults 5.2
    console do
      require "pry"
      config.console = Pry
    end
    config.autoload_paths << "#{Rails.root}/lib/controller"
  end
end
