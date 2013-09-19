class QuestionsController < ApplicationController
  def new
    @question = Question.new
    # TODO: NEED USER OBJECT
    # @user = current_user
  end

  def create
    question = Question.new(params[:question])
    puts params[:question]
    question.save
    redirect_to question_path(question)
  end

  def show
  end

end