module Api
  class VisitsController < ApplicationController
    def index
      visits = Visit.limit(12).includes(:visitor)
        .where(profile_id: current_user.profile.id)
      @visitors = visits.map { |visit| visit.visitor }
      render :index
  end
end