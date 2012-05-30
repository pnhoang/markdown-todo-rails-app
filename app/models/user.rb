class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  
  has_secure_password
  validate :password, presence: true
  validate :email, presence: true
end
