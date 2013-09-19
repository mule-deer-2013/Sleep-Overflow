class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    puts params
    comment = Comment.new(params[:comment])
    if params[:answer_id]
      answer = Answer.find(params[:answer_id])
      answer.comments << comment
      question = Question.find(answer.question_id)
    else
      question = Question.find(params[:question_id])
      question.comments << comment
    end
    user = User.find(session[:user_id])
    user.comments << comment
    comment.save
    redirect_to question_path(question)
  end

end