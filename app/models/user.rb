class User < ActiveRecord::Base
  # REVIEW: please go look at has_secure_password code, it's simple
  has_secure_password
  validates :username, :email, :password, presence: true
  attr_accessible :username, :email, :password, :password_confirmation

  has_many :votes
  has_many :comments
  has_many :questions
  has_many :answers

  def voted? votable
    self.votes.select {|v| v.votable == votable}
  end
end
