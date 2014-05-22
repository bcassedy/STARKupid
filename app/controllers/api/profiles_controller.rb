module Api
  class ProfilesController < ApplicationController
    def index
      @profiles = Profile.all
      render :index
    end
  end
end
