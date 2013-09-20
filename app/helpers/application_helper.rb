module ApplicationHelper
  def index_page?
    "/" == request.fullpath || "/questions" == request.fullpath
  end

  def current_vote(votable)
    Vote.where(votable_id: votable.id, votable_type: votable.class.to_s, user_id: current_user.id).first  
  end
end
