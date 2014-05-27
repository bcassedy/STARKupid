module Api
  class ProfilesController < ApplicationController
    def index
      @profiles = Profile.all
      assign_match_percent
      render :index
    end

    def show
      @profile = Profile.find_by_username(params[:id])
      Visit.create_or_update(current_user.profile.id, @profile.id)
      render partial: 'api/profiles/profile', locals: { profile: @profile }
    end

    def create
      @profile = Profile.new(profile_params)
      @profile.user_id = current_user.id
      @profile.username = current_user.username
      if @profile.save
        render partial: 'api/profiles/profile', locals: { profile: @profile }
      else
        render json: { errors: @profile.errors.full_messages }, status: 422
      end
    end

    def update
      @profile = Profile.find_by_username(params[:id])
      if @profile.update_attributes(profile_params)
        render partial: 'api/profiles/profile', locals: { profile: @profile }
      else
        render json: { errors: @profile.errors.full_messages }, status: 422
      end
    end

    def search
      @profiles = Profile.search_by_username(params[:query])
      assign_match_percent
      render :index
    end

    private

    def profile_params
      params.require(:profile).permit(
        :photo_url,
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

    def assign_match_percent
      @profiles.each do |profile|
        break unless current_user.profile
        profile.match_percentage = current_user.profile.match(profile)
      end
    end
  end
end
