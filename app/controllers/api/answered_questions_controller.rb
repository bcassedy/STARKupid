module Api
  class AnsweredQuestionsController < ApplicationController
    def create
      answered_question = AnsweredQuestion.new(answered_question_params)
      answered_question.question_id = params[:question_id]
      answered_question.profile_id = current_user.profile.id
      if answered_question.save
        render json: answered_question
      else
        render json: answered_question.errors.full_messages
      end
    end

    private

    def answered_question_params
      params.require(:answered_question).permit(:answer_id)
    end
  end
end
