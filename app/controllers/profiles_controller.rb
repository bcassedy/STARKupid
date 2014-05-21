class ProfilesController < ApplicationController
  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to profile_url(@profile)
    else
      flash.now[:errors] = @profile.errors.full_messages
      render :new
    end
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
end
