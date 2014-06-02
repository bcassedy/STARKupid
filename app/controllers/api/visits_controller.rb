module Api
  class VisitsController < ApplicationController
    before_action :ensure_logged_in

    def index
      @visitors = current_user.profile.visitors.page(params[:page])
      @visitors.each do |visitor|
        break unless current_user.profile
        visitor.match_percentage = current_user.profile.match(visitor)
      end
      render :index
    end
  end
end