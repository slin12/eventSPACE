class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      flash[:notice] = "You've successfully posted a message!"
    else
      flash[:notice] = "You didn't write anything!"
    end
    redirect_to request.referrer
  end

  private
  def message_params
    params.require(:message).permit(:content, :event_id)
  end

end
