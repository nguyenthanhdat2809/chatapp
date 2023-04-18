class HomeController < ApplicationController
	before_action :authenticate_user!
	
	def index
		session[:conversation] ||= nil
		@users = User.all.where.not(id: current_user.id)
		@conversation = Conversation.includes(:recipient, :messages).find_by(id: session[:conversation])
	end
end
