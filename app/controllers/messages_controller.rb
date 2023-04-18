class MessagesController < ApplicationController
	def create
		@conversation = Conversation.includes(:recipient).find(params[:conversation_id])
		@message = @conversation.messages.create(message_params)
		ActionCable.server.broadcast "room_channel_#{@conversation.id}", conversation: @conversation, html: html(@message)
	end

	private
 
  def message_params
    params.require(:message).permit(:user_id, :body)
  end

  def html(message)
    ApplicationController.render(
      partial: 'messages/message',
      locals: { message: message, user: current_user }
    )
  end
end
