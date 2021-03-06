class QuestionsController < ApplicationController
  def index
    @user = User.new
    @questions = Question.order("score DESC")
    @vote = Vote.new
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
      @vote = Vote.new
      @current_user = User.find(session[:user_id])
    end
    @question = Question.find(params[:id])
    best_answer = @question.best_answer
    if best_answer
      @answers = (@question.answers.order("score DESC") - [best_answer]).unshift(best_answer)
    else
      @answers = @question.answers.order("score DESC")
    end
  end

  def update
    question = Question.find(params[:id])
    if params[:question][:best_answer_id] == "0"
      question.best_answer = nil
      question.save
    else
      question.best_answer = Answer.find(params[:question][:best_answer_id])
      question.save
    end
    redirect_to question
  end

end
