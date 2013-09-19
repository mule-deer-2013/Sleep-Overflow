class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    p params
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
    else
      flash[:notices] = "signup failed"
    end
    redirect_to root_path
  end

end
