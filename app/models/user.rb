class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: { message: 'This username is already in use'}
  validates :email, presence: true, uniqueness: { message: 'This email is already in use' }
  validates :first_name, presence: true
  validates :last_name, presence: true
end
