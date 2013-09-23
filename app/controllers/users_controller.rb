class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    # REVIEW: this should be handled in your model.
    if user.password == user.password_confirmation
      user.save
      login user
      redirect_to question
    else
      flash[:notices] = "signup failed"
      # fix this to eror message
    end
  end


  def show
    # why are you setting an instance variable? why not use current_user.username in the view?
    @username = current_user.username
    @user_answers = current_user.answers
    @user_questions = current_user.questions
    @user_comments = current_user.comments
  end

end
