class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  
  has_secure_password
  has_many :api_keys
  validate :password, presence: true
  validate :email, presence: true
end
