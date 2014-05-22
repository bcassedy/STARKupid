class MessagesController < ApplicationController
  def create
    @message =  Message.new(message_params)
    @message.sender_id = current_user.id
    receiver = User.find_by_username(params[:username])
    @message.receiver_id = receiver.id
    if @message.save
      redirect_to show_profile_url(receiver.username)
    else
      flash.now[:errors] = @message.errors.full_messages
      render :new
    end
  end

  def new
    @message = Message.new
  end

  def show
    @message = Message.find(params[:id])
  end

  def index
    @messages = Message.where(receiver_id: current_user.id)
  end

  private

  def message_params
    params.require(:message).permit(:title, :body)
  end
end
