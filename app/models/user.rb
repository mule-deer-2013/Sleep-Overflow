class User < ActiveRecord::Base
  validates :username, :email, :password_hash, presence: true
  attr_accessible :username, :email, :password_hash
  
  has_many :votes
  has_many :comments
  has_many :questions
  has_many :answers
end