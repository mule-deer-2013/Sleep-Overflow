class SessionsController < ApplicationController
  
  def new
    
    # if user = User.find_by_username(params[:username])
    #   session[:user_id] = user.id
    # else
    #   flash[:notices] = "incorrect login"
    # end
    #   redirect_to root_path
  end

  def create
    if User.find_by_username(params[:username]).try(:authenticate, params[:password]) != false
      user = User.find_by_username(params[:username])
      session[:user_id] = user.id
      redirect_to new_question_path
    else
      # flash[:notices] = "incorrect login"
      # change this to error message
    end
  end

   def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
