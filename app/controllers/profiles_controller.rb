class ProfilesController < ApplicationController
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    @profile.username = current_user.username
    if @profile.save
      redirect_to profile_url(@profile)
    else
      flash.now[:errors] = @profile.errors.full_messages
      render :new
    end
  end

  def edit
    @profile = Profile.find_by_username(params[:username])
  end

  def new
    @profile = Profile.new
  end

  def show
    @profile = Profile.find_by_username(params[:username])
  end

  def index
    @profiles = Profile.all
  end

  def update
    @profile = Profile.find_by_username(params[:username])
    if @profile.update_attributes(profile_params)
      redirect_to profile_url(@profile)
    else
      flash.now[:errors] = @profile.errors.full_messages
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :age, 
      :gender, 
      :location, 
      :summary, 
      :skills, 
      :interests,
      :life_direction,
      :goals
    )
  end
end
