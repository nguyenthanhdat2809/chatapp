class ConversationsController < ApplicationController
	def create
		@conversation = Conversation.get(current_user.id, params[:user_id])
		add_to_conversation unless conversated?

		respond_to do |format|
			format.js
		end
	end

	def close
		@conversation = Conversation.find(params[:id])
		session.delete(:conversation) if @conversation.id == session[:conversation]

		respond_to do |format|
      format.js
    end
	end

	private

	def add_to_conversation
		session[:conversation] = @conversation.id
	end

	def conversated?
		session[:conversation] == @conversation.id
	end
end
