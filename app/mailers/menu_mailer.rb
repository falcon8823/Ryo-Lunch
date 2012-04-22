# coding: utf-8
class MenuMailer < ActionMailer::Base
  default from: "Ryo-Lunch <#{APP_CONFIG['sender-mail']}>",
    reply_to: APP_CONFIG['support-mail'],
    errors_to: APP_CONFIG['support-mail']

  def today
    @today = DailyMenu.today

    if @today.nil?
      raise
    end

    @tomorrow = DailyMenu.tomorrow
    bcc = User.all.map{ |u| u.email }
    
    mail to: APP_CONFIG['support-mail'],
      subject: "#{l(Date.today, format: :short)}のRyo-Lunch",
      bcc: bcc
  end
end
