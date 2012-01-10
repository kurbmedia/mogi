require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Mogi
  
  class << self
    
    def config
      @config ||= generate_config
    end
    
    private
    
    def generate_config
      mappings = { ":rails_root" => Rails.root }      
      conf    = YAML::load(File.open("config/config.yml"))[Rails.env]
      options = ActiveSupport::OrderedOptions.new
      conf.each do |key, value|
        options[key.to_sym] = value.gsub(/:([a-zA-Z0-9_]+)/){ |match| mappings[match] }
      end
      options
    end
    
  end
  
  class Application < Rails::Application
    
    # config.autoload_paths += %W(#{config.root}/extras)

    config.time_zone = 'Eastern Time (US & Canada)'

    # config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable the asset pipeline
    config.assets.enabled = true
    config.assets.precompile << "screen.css"

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'
    
  end
end
