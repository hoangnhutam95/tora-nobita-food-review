class MessagesController < ApplicationController	
	before_action :logged_in_user
	def create
		@message=Message.new(message_params)
		if @message.save
			
		else
			flash[:danger]="Failed"
			puts @message.errors.full_messages
		end
	end
	private
	def message_params
		params.require(:message).permit(:conversation_id,:user_id,:body)		
	end
end
