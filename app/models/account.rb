class Account < ActiveRecord::Base
  attr_accessible :account_type, :contact_number, :credits, :email_address, :full_name, :password, :password_confirmation, :username, :remember_token
  has_secure_password
  has_many :carts
  has_many :orders

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email_address, presence: true, format: { with: EMAIL_REGEX }
  validates :full_name, :username, :account_type, :contact_number, presence: true

  before_save :create_remember_token

  private

  def create_remember_token
  	self.remember_token = SecureRandom.urlsafe_base64
  end
end
