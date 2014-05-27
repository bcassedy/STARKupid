module Api
  class FavoritesController < ApplicationController
    def index
      @favorites = Favorite.where(profile_id: current_user.profile.id)
      render :index
    end

    def create
      debugger
    end
  end
end