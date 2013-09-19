class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def new
    @question = Question.new
  end

  def create
    question = Question.new(params[:question])
    user = User.find(session[:user_id])
    user.questions << question
    question.save
    redirect_to question_path(question)
  end

  def show
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
    @question = Question.find(params[:id])
  end

end
