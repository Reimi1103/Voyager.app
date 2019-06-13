Rails.configuration.stripe = {
    :publishable_key => ENV["stripe_public_key"],
    :secret_key      => ENV['stripe_secret_key']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

#ENVには.envファイルで設定した変数名を入れる
