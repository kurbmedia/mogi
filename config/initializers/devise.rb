# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.mailer_sender = "changeme@example.com"

  # Configure the class responsible to send e-mails.
  # config.mailer = "Devise::Mailer"

  require 'devise/orm/mongoid'
  
  config.authentication_keys = [ :email ]
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.params_authenticatable = true
  config.http_authenticatable   = true
  config.http_authenticatable_on_xhr = true
  config.http_authentication_realm = "Git Repository Access"

  config.stretches = Rails.env.test? ? 1 : 10
  config.pepper = "71e1aa7e5ac7d8b9e730768c8ebf23709e842c0e4d7a56642cea4a7cac19eac05c9ab0e73edd06d5ac11bbcc48c26befcadc01d2931dea240dc08edd73d9e942"

  config.remember_for = 2.weeks
  config.remember_across_browsers   = true
  config.use_salt_as_remember_token = true
  config.password_length            = 6..128
  config.email_regexp               = /\A[^@]+@[^@]+\z/

  config.timeout_in               = 20.minutes
  config.token_authentication_key = :auth_token
  config.stateless_token = true

  config.sign_out_all_scopes = true
  config.sign_out_via        = :delete
end
