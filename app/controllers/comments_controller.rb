class CommentsController < ApplicationController
  before_filter :load_commentable, :only => [:create]
  def new
    @comment = Comment.new
  end


  def create
    @comment = @commentable.comments.build params[:comment]
    if @comment.save
      # do something
    else
      # do something else
    end

  end

  private
  def load_commentable
    @commentable = params[:answer_id] ? Answer.find params[:answer_id] : Question.find params[:id]
  end
end
