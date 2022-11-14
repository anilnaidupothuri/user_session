class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  has_secure_password

  has_many :microposts, dependent: :destroy
end
