APP_CONFIG = YAML.load_file("#{Rails.root}/config/ryo-lunch.yml")[Rails.env]

Twitter.configure do |config|
  config.consumer_key = APP_CONFIG['t_consumer_key']
  config.consumer_secret = APP_CONFIG['t_consumer_secret']
  config.oauth_token = APP_CONFIG['t_access_token']
  config.oauth_token_secret = APP_CONFIG['t_access_token_secret']
end
