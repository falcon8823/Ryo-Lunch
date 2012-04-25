class RegistrationMailer < ActionMailer::Base
  default from: "Ryo-Lunch <#{APP_CONFIG['sender-mail']}>",
    reply_to: APP_CONFIG['support-mail'],
    errors_to: APP_CONFIG['support-mail']

  def receive(mail)
    email = mail.from.first
  end
  
  def activation(user)
    mail to: user.email,
      subject: "[Ryo-Lunch]$BEPO?(BURL"
  end

  def complete(user)
    mail to: user.email,
      subject: "[Ryo-Lunch]$BEPO?40N;(B"
  end
end
