class User < ActiveRecord::Base
  validates :email,
    uniqueness: true,
    presence: true,
    format: {with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/},
    length: {maximum: 256}
end
