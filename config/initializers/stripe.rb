# Rails.configuration.stripe = {
#   :publishable_key => Rails.application.credentials.dig(:stripe, :public_key),
#   :secret_key => Rails.application.credentials.dig(:stripe, :secret_key), 
# }


#   Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)
Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLIC_KEY'],
  :secret_key      => ENV['STRIPE_SECRET']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]