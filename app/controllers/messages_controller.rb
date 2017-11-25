class MessagesController < ApplicationController	
	before_action :logged_in_user
	def create
		@message=Message.new(message_params)
		if @message.save
			ChatJob.perform_later(@message)
		else			
		end
	end
	private
	def message_params
		params.require(:message).permit(:conversation_id,:user_id,:body)		
	end
end
