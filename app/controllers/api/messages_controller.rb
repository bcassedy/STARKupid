module Api
  class MessagesController < ApplicationController
    before_action :ensure_logged_in

    def create
      @message =  Message.new(message_params)
      @message.sender_id = current_user.id
      receiver = User.find_by_username(params[:profile_id])
      @message.receiver_id = receiver.id
      @message.update_attributes(read: false)
      p @message
      if @message.save
        render partial: 'api/messages/message', locals: { message: @message }
      else
        p @message.errors.full_messages
        render json: { errors: @message.errors.full_messages }, status: 422
      end
    end

    def show
      @message = Message.find(params[:id])
      @message.update_attributes(read: true)
      render partial: 'api/messages/message', locals: { message: @message }
    end

    def index
      @messages = Message.includes(:sender).where(receiver_id: current_user.id)
      render :index
    end

    def destroy
      @message = Message.find(params[:id])
      @message.destroy
      render partial: 'api/messages/message', locals: { message: @message }
    end

    private

    def message_params
      params.require(:message).permit(:title, :body)
    end
  end
end
