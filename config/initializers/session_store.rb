Rails.application.config.session_store :cookie_store,
  key: '_eic_sis_session',
  expire_after: 1.year,
  secure: Rails.env.production?,
  same_site: :lax
