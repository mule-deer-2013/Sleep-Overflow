module ApplicationHelper
  def index_page?
    "/" == request.fullpath || "/questions" == request.fullpath
  end

  def current_vote(votable)
    Vote.where(votable_id: votable.id, votable_type: votable.class.to_s, user_id: current_user.id).first  
  end

  def question_creator?(question)
    user = current_user
    if user
      user.id == question.user_id
    end
  end

  def best_answer?(question, answer_id)
    question.best_answer_id == answer_id
  end
end
