class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_PHONE_REGEX = /(09|03|05|07|08)+([0-9]{8})\b/

  attr_accessor :remember_token

  before_save -> {email.downcase!}

  validates :name, presence: true, length: {maximum: Settings.user.name._max}
  validates :email, presence: true, length: {maximum: Settings.user.email._max},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :address, presence: true
  validates :phone, presence: true, format: {with: VALID_PHONE_REGEX}
  validates :password, length: {minimum: Settings.user.password._min}
  enum role: { customer: 0, admin: 1 }
  has_secure_password

  class <<self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.blank?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
