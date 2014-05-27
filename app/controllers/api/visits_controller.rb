module Api
  class VisitsController < ApplicationController
    def index
      visits = Visit.limit(12).includes(:visitor)
        .where(profile_id: current_user.profile.id).page(params[:page])
      @visitors = visits.map { |visit| visit.visitor }
      @visitors.each do |visitor|
        break unless current_user.profile
        visitor.match_percentage = current_user.profile.match(visitor)
      end
      render :index
    end
  end
end