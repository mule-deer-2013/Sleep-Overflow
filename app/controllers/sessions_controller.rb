class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
  def new
    if user = User.find_by_username(params[:username])
      session[:user_id] = user.id
    else
      flash[:notices] = "incorrect login"
    end
      redirect_to root_path
  end
end
