class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  # REVIEW: look at questions#create implementation
  def create
    answer = Answer.new(params[:answer])
    question = Question.find(params[:question_id])
    question.answers << answer
    user = User.find(session[:user_id])
    user.answers << answer
    answer.save
    redirect_to question_path(question)
  end

end
