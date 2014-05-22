class SessionsController < ApplicationController
  def create
    user = User.find_by_creds(user_params[:username], user_params[:password])
    if user
      signin_user!(user)
      redirect_to root_url
    else
      flash.now[:errors] = ['Invalid username/password']
      render :new
    end
  end

  def destroy
    session[:token] = nil
    redirect_to new_session_url
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
