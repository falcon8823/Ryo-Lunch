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
    bcc = User.active.map{ |u| u.email }
    
    mail to: APP_CONFIG['support-mail'],
      subject: "[Ryo-Lunch] #{l(Date.today, format: :short)}の献立",
      bcc: bcc
  end

  def t_today_breakfast
    menu = DailyMenu.today.breakfast
    raise if menu.nil?

    tweet menu, Date.today, "朝食"
  end

  def t_today_lunch
    menu = DailyMenu.today.lunch
    raise if menu.nil?

    tweet menu, Date.today, "昼食"
  end

  def t_today_dinner
    menu = DailyMenu.today.dinner
    raise if menu.nil?

    tweet menu, Date.today, "夕食"
  end

  private

  def tweet(menu, date, time)
    date = l(date, format: :short)
    text = "[Ryo-Lunch] #{date}の#{time}：\n#{menu} #ryo_lunch"

    Twitter.update text
  end

end
