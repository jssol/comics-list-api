class User < ApplicationRecord
  has_secure_password

  has_many :events, dependent: :destroy
  has_many :comics, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, { format: { with: URI::MailTo::EMAIL_REGEXP }, message: "This email already exists" }
  validates :first_name, presence: true
  validates :last_name, presence: true
end
