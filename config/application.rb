require File.expand_path('../boot', __FILE__)

require 'rails/all'
# require 'wicked_pdf'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BlocAcres
  class Application < Rails::Application
    config.assets.precompile << 'delayed/web/application.css'


    # WICKED PDF START
    # config.middleware.use WickedPdf::Middleware
    # config.assets.paths << "#{Rails.root}/app/assets/stylesheets/font-awesome-4.2.0/css/"
    # config.assets.paths << "#{Rails.root}/app/assets/stylesheets/bootstrap/"
    # config.assets.paths << "#{Rails.root}/vendor/assets/fonts"
    # WICKED PDF END

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.action_view.embed_authenticity_token_in_remote_forms = true
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.autoload_paths += %W(#{config.root}/lib)

    config.time_zone = 'Eastern Time (US & Canada)'
    config.active_record.default_timezone = :local # Or :utc

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.active_record.raise_in_transactional_callbacks = true
    config.assets.enabled = true
    config.assets.version = '1.01019'
    config.serve_static_files = true
    config.active_job.queue_adapter = :delayed_job

  end
end
