class Answer < ActiveRecord::Base
  attr_accessible :content, :user_id, :question_id, :is_best_answer

  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  belongs_to :user
  belongs_to :question

  validates :content, :user_id, :question_id, presence: true

  def score
  	return votes.where(up_down: true).count - votes.where(up_down: false).count
  end
end
