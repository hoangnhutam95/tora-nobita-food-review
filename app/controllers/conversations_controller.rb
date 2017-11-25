class ConversationsController < ApplicationController
	before_action :logged_in_user
	def show
		@conversation=current_user.conversations.find_by_id(params[:id])
		redirect_to root_path unless @conversation
		@sender=current_user
		@receiver= (@sender==@conversation.user1 ? @conversation.user2 : @conversation.user1)
	end
	def create
		@conversation=Conversation.new(conversation_params)
		if @conversation.save
			flash[:succes]="Success"
			redirect_to @conversation
		else
			flash[:danger]="Failed"
			puts @conversation.errors.full_messages			
		end
	end
	private
	def conversation_params
		params.require(:conversation).permit(:user1_id,:user2_id)
	end
end
