Rails.configuration.stripe = {
    publishable_key: 'pk_test_cRzT97SZoD13r1a2JB1eHZH9',
    secret_key: 'sk_test_P5q8J3iycHjIft5DWnQmVXJH'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
