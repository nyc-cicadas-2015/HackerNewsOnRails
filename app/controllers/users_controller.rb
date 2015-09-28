class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      redirect_to users_login_signup_path
    end
  end

  def login
    user = User.find_by(username: params[:user][:username])
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to users_login_signup_path
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
