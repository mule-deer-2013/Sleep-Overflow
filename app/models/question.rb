class Question < ActiveRecord::Base
  attr_accessible :title, :content, :user_id
  validates :title, :content, :user_id, presence: true

  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
end