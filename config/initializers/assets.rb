# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( static_pages.css )
Rails.application.config.assets.precompile += %w( landing_page.css )
Rails.application.config.assets.precompile += %w( users.css )
Rails.application.config.assets.precompile += %w( dashboard.css )
Rails.application.config.assets.precompile += %w( company_accounts.css )
Rails.application.config.assets.precompile += %w( bank_system.css )
Rails.application.config.assets.precompile += %w( contract.css )
Rails.application.config.assets.precompile += %w( user_bank_interface.css )
Rails.application.config.assets.precompile += %w( stock_trans.js )
Rails.application.config.assets.precompile += %w( carousel.css )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
