class RegistrationMailer < ActionMailer::Base
  default from: "Ryo-Lunch <#{APP_CONFIG['sender-mail']}>",
    reply_to: APP_CONFIG['support-mail'],
    errors_to: APP_CONFIG['support-mail']

  def receive(mail)
    email = mail.from.first
  end
  
  def activation(user)
    mail to: user.email,
      subject: "[Ryo-Lunch]登録URL"
  end

  def complete(user)
    mail to: user.email,
      subject: "[Ryo-Lunch]登録完了"
  end
end
