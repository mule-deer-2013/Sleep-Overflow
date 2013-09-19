class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end
end
