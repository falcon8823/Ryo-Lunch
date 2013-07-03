class Admin::ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :digest_auth if Rails.env.production?

  private

  # ダイジェスト認証
  # Digest::MD5::hexdigest([username, 'ryo-lunch-admin', password].join(':'))
  # で生成可能
  def digest_auth
    users = APP_CONFIG['admin_users']
    authenticate_or_request_with_http_digest('ryo-lunch-admin') do |n|
      users[n]
    end
  end
end
