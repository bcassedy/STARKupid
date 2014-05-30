module Api
  class ProfilesController < ApplicationController
    def index
      @profiles = Profile.includes(:photos).page(params[:page])
      assign_match_percent
      @profiles << Profile.find_by_username(current_user.username)
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
      params[:photo][:url].each do |url|
        @profile.photos.create(url: url)
      end
      if @profile.save
        render partial: 'api/profiles/profile', locals: { profile: @profile }
      else
        render json: { errors: @profile.errors.full_messages }, status: 422
      end
    end

    def update
      @profile = Profile.includes(:photos).find_by_username(params[:id])
      @profile.photos.destroy_all
      params[:photo][:url].each do |url|
        @profile.photos.create(url: url)
      end
      if @profile.update_attributes(profile_params)
        render partial: 'api/profiles/profile', locals: { profile: @profile }
      else
        render json: { errors: @profile.errors.full_messages }, status: 422
      end
    end

    def search
      @profiles = Profile.search_by_username(params[:query])
      assign_match_percent
      render :search_results
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
