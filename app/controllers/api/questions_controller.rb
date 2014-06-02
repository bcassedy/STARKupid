module Api
  class QuestionsController < ApplicationController
    before_action :ensure_logged_in

    def index
      @questions = Question.includes(:answer_choices).all
      @questions.reject! do |q|
        current_user
          .profile
          .question_responses
          .pluck(:question_id)
          .include?(q.id)
      end
      render :index
    end

    def show
      @question = Question.find(params[:id])
      render partial: 'api/questions/question', locals: { question: @question }
    end
  end
end
