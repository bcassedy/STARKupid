module Api
  class QuestionsController < ApplicationController
    def index
      @questions = Question.includes(:all
      render :index
    end

    def show
      @question = Question.find(params[:id])
      render partial: 'api/questions/question', locals: { question: @question }
    end
  end
end