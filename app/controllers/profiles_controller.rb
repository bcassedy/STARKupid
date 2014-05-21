class ProfilesController < ApplicationController
  before_action :one_profile_per_user, only: [:new, :create]
  before_action :ensure_owner, only: [:edit, :update]

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

  def one_profile_per_user
    redirect_to edit_profile_url(current_user) if current_user.profile
  end

  def ensure_owner
    unless Profile.find_by_username(params[:username]).user_id == current_user.id
      redirect_to profiles_url
    end
end
