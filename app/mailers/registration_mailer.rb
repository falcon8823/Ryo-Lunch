# coding: utf-8

require 'securerandom'
class RegistrationMailer < ActionMailer::Base
  default from: "Ryo-Lunch <#{APP_CONFIG['sender-mail']}>",
    reply_to: APP_CONFIG['support-mail'],
    errors_to: APP_CONFIG['support-mail']

  def receive(mail)
    email = mail.from.first
    user = User.find_by_email(email)

    if user
      # ユーザが存在する場合は，
      # 解除処理 or 再発行処理なのでコードと有効期限をセット
      user.activation_code = SecureRandom.hex(16).to_s
      user.activation_start = Time.now
      user.save!

      if user.active
        # 既に登録済みの場合
        # 解除処理へ
        stopping_mail(user)
      else
        # 登録が完了していない場合
        # URLを再発行しメールを送信
        activation_mail(user)
      end
    else
      # ユーザが存在しない場合
      # 登録処理へ
      user = User.create!(
        email: email,
        active: false,
        activation_start: Time.now,
        activation_code: SecureRandom.hex(16).to_s
      )

      activation_mail(user)
    end
  end
  
  # 登録を完了させるURLを送るメール
  def activation_mail(user)

    mail to: user.email,
      subject: "[Ryo-Lunch]登録URL"
  end

  # 解除を完了させるURLを送るメール
  def stopping_mail(user)

    mail to: user.email,
      subject: "[Ryo-Lunch]登録解除URL"
  end

end
