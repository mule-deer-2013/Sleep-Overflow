class QuestionsController < ApplicationController
  def index
    @questions = Question.order("score DESC")
    @vote = Vote.new
  end

  def new
    @question = Question.new
  end

  def create
    user = User.find(session[:user_id]) # user current_user!!!
    @question = current_user.questions.build params[:question]
    if @question.save
      redirect_to question_path(question)
    else
      render :new
    end
  end

  # REVIEW: this action is HUGE and handling too much
  def show
    # create a before_filter that checks if authenticated?
    if session[:user_id] # if current_user
      @vote = Vote.new
      @current_user = User.find(session[:user_id]) #why? you already have current_user
    end
    @question = Question.find(params[:id])
    # this shouldn't be handled in the controller
    best_answer = @question.best_answer
    if best_answer
      @answers = (@question.answers.order("score DESC") - [best_answer]).unshift(best_answer)
    else
      @answers = @question.answers.order("score DESC")
    end
  end

  def update
    question = Question.find(params[:id])
    # this should happen in the model in a before_save
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
