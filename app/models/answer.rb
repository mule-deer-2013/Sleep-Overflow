class Answer < ActiveRecord::Base
  attr_accessible :content, :user_id, :question_id, :is_best_answer

  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  belongs_to :user
  belongs_to :question
end