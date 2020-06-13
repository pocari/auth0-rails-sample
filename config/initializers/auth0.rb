Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    ENV.fetch('AUTH0_CLIENT_ID') { 'dummy_id' },
    ENV.fetch('AUTH0_CLIENT_SECRENT') { 'dummy_secret' },
    ENV.fetch('AUTH0_DOMAIN') { 'dummy_domain' },
    callback_path: '/auth/auth0/callback',
    authorize_params: {
      scope: 'openid email profile'
    }
  )
end
