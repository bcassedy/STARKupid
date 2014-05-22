module Api
  class ProfilesController < ApplicationController
    def index
      @profiles = Profile.all
      render :index
    end

    def show
      @profile = Profile.find_by_username(params[:id])
      render partial: 'api/profiles/profile', locals: { profile: @profile }
    end
  end
end
