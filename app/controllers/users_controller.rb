class UsersController < ApplicationController
  def new
    # updated
    @user = User.new
    render :new
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
