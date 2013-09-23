class SessionsController < ApplicationController

  def new
    # REVIEW: commented code is evil
    # if user = User.find_by_username(params[:username])
    #   session[:user_id] = user.id
    # else
    #   flash[:notices] = "incorrect login"
    # end
    #   redirect_to root_path
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate params[:password]
      login user
      redirect_to root_path
    else
      # flash[:notices] = "incorrect login"
      # change this to error message
    end
  end

   def destroy
    session.delete :user_id # or session.clear
    redirect_to root_path
  end
end
