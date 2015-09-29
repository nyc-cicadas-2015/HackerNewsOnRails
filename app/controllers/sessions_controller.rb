class SessionsController < ApplicationController

 def new
  @user = User.new
 end

 def create
    user = User.find_by(username: params[:user][:username])
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      flash[:success] = "Success"
      redirect_to root_path
    else
      redirect_to sessions_new_path
    end
  end

  def destroy
    session.clear
    flash[:logout] = "You are successfully logged out"
    redirect_to root_path
  end


end
