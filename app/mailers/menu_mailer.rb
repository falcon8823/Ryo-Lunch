# coding: utf-8
class MenuMailer < Jpmobile::Mailer::Base
  default from: "Ryo-Lunch <#{APP_CONFIG['sender-mail']}>",
    reply_to: APP_CONFIG['support-mail'],
    errors_to: APP_CONFIG['support-mail']

  def today
    @today = DailyMenu.today

    if @today.nil?
      raise
    end

    @tomorrow = DailyMenu.tomorrow
    bcc = User.active.map{ |u| u.email }
    
    mail to: APP_CONFIG['support-mail'],
      subject: "[Ryo-Lunch] #{l(Date.today, format: :short)}の献立",
      bcc: bcc
  end
end
