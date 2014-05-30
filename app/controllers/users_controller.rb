class UsersController < ApplicationController
  def new
    @user = User.new
    render :new, layout: false
  end

  def create
    @user = User.new(user_params)
    if @user.save
      signin_user!(@user)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
