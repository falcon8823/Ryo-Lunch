# coding: utf-8
class MenuMailer < ActionMailer::Base
  default from: "Ryo-Lunch <#{APP_CONFIG['sender-mail']}>",
    reply_to: APP_CONFIG['support-mail'],
    errors_to: APP_CONFIG['support-mail']

  def today
    @today = DailyMenu.today

    if @today.nil? || @today.lunch.blank? || @today.dinner.blank?
      raise
    end

    @tomorrow = DailyMenu.tomorrow
    bcc = User.active.map{ |u| u.email }
    
    mail to: APP_CONFIG['support-mail'],
      subject: "[Ryo-Lunch] #{l(Date.today, format: :short)}の献立",
      bcc: bcc
  end

  def t_today_breakfast
    menu = DailyMenu.today
    raise if menu.nil?
    menu_str = menu.breakfast

    tweet menu_str, Date.today, "朝食", menu if menu_str.present?
  end

  def t_today_lunch
    menu = DailyMenu.today
    raise if menu.nil?
    menu_str = menu.lunch

    tweet menu_str, Date.today, "昼食", menu if menu_str.present?
  end

  def t_today_dinner
    menu = DailyMenu.today
    raise if menu.nil?
    menu_str = menu.dinner

    tweet menu_str, Date.today, "夕食", menu if menu_str.present?
  end

  private

  def tweet(menu_str, date, time, menu)
    date = l(date, format: :very_short)
    text = "#{date}の#{time}:\n#{menu_str}\n#{daily_menu_url(menu)}\n#ryo_lunch"

    Twitter.update text
  end

end
