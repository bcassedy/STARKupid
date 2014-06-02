class SessionsController < ApplicationController
  def create
    user = User.find_by_creds(user_params[:username], user_params[:password])
    if user
      signin_user!(user)
      redirect_to root_url
    else
      flash.now[:errors] = ['Invalid username/password']
      @user = User.new
      render :new
    end
  end

  def destroy
    session[:token] = nil
    redirect_to root_url
  end

  def new
    @user = User.new
  end

  def landing
    @user = User.new
    render :new if current_user
  end

  def guest
    user = User.find_by_creds('tony_stark', 'zxcvbnm')
    signin_user!(user)
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
