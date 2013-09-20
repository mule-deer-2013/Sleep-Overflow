class User < ActiveRecord::Base
  validates :username, :email, presence: true
  attr_accessible :username, :email, :password, :password_confirmation
  
  has_many :votes
  has_many :comments
  has_many :questions
  has_many :answers
  has_secure_password
end
