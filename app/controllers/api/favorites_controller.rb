module Api
  class FavoritesController < ApplicationController
    def index
      @favorites = current_user.profile.favorited_profiles.page(params[:page])
      @favorites.each do |profile|
        break unless current_user.profile
        profile.match_percentage = current_user.profile.match(profile)
      end
      render :index
    end

    def create
      profile = Profile.find_by_username(params[:username])
      @favorite = Favorite.new(favorited_id: profile.id)
      @favorite.profile_id = current_user.profile.id
      if @favorite.save
        render partial: 'api/profiles/profile', locals: { profile: profile }
      else
        render json: @favorite.errors.full_messages
      end
    end

    def destroy
      profile = Profile.find_by_username(params[:username])
      favorite = Favorite.where(
        profile_id: current_user.profile.id,
        favorited_id: profile.id
      ).first
      favorite.destroy
      render json: favorite
    end
  end
end