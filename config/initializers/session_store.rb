if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: "_bookings_app", domain: "serene-depths-82382.herokuapp.com", same_site: :none, secure: true
else
  Rails.application.config.session_store :cookie_store, key: "_bookings_app"
end