class Vote < ActiveRecord::Base
  attr_accessible :votable_id, :user_id, :votable_type, :up_down

  belongs_to :user
  belongs_to :votable, polymorphic: true
  validates_uniqueness_of :user_id, scope: [:votable_id, :votable_type]

  validates :votable_id, :votable_type, :user_id, presence: true
  validates_inclusion_of :up_down, :in => [true, false]

  after_save :update_question_answer_score
  after_destroy :update_question_answer_score

  def update_question_answer_score
    votable_obj = self.votable
    votable_obj.score = votable_obj.tally
    votable_obj.save
  end
end
