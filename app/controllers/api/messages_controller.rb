module Api
  class MessagesController < ApplicationController
    def create
      @message =  Message.new(message_params)
      @message.sender_id = current_user.id
      receiver = User.find_by_username(params[:profile_id])
      @message.receiver_id = receiver.id
      if @message.save
        render partial: 'api/messages/message', locals: { message: @message }
      else
        render json: { errors: @message.errors.full_messages }, status: 422
      end
    end

    def show
      @message = Message.find(params[:id])
    end

    def index
      @messages = Message.includes(:sender).where(receiver_id: current_user.id)
      render :index
    end

    private

    def message_params
      params.require(:message).permit(:title, :body)
    end
  end
end