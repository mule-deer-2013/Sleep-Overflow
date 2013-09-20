class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.password == user.password_confirmation
      user.save
      session[:user_id] = user.id
      redirect_to new_question_path
    else
      flash[:notices] = "signup failed"
      # fix this to eror message
    end
  end
  

  def show
    @username = current_user.username
    @user_answers = current_user.answers
    @user_questions = current_user.questions
    @user_comments = current_user.comments

  end

end
