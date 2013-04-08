# coding: utf-8
class User < ActiveRecord::Base
  attr_accessible :email

  validates :email,
    uniqueness: true,
    presence: true,
    length: {maximum: 256}
  validate :email_valid?

  scope :active, where(active: true)
  scope :inactive, where(active: false)

  private

  def email_valid?
    unless email =~ /^([^@\s]+)[^.]@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i && email !~ /[.]{2}/
      errors.add(:email, 'は不正な形式のメールアドレスです。')
    end
  end
end
