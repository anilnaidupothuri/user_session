class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  has_secure_password

  attr_accessor :activation_token

  before_save :downcase_email
  before_create :create_activation_digest

  def downcase_email
    self.email = email.downcase
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # Returns the hash digest of the given string.
  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password?(token)
  end
  def activate
update_attribute(:activated, true)
update_attribute(:activated_at, Time.zone.now)
end

def send_activation_email
UserMailer.account_activation(self).deliver_now
end
end
