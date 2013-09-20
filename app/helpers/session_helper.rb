 module SessionHelper
 def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def index_page?
    "/" == request.fullpath || "/questions" == request.fullpath
  end
end
