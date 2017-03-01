Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter #add the keys
end
