Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['2055433697808989'], ENV['477f5067b59eec7f08d7a0f2ef3f7c7a']
end
