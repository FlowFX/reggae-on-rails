# frozen_string_literal: true

if Rails.env.production?
  Mailgun.configure do |config|
    config.api_key = Rails.application.credentials.dig(:mailgun, :api_key)
  end
end
