class User < ActiveRecord::Base
  validates :email,
    uniqueness: true,
    presence: true,
    format: {with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/},
    length: {maximum: 256}

  scope :active, where(active: true)
  scope :inactive, where(active: false)
end
