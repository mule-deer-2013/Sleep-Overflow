class Question < ActiveRecord::Base
  attr_accessible :title, :content, :user_id
  validates :title, :content, :user_id, presence: true

  belongs_to :user
  belongs_to :best_answer, class_name: :Answer
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def score
    return votes.where(up_down: true).count - votes.where(up_down: false).count
  end
end
