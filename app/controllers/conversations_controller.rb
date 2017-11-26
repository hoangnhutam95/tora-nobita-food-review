class ConversationsController < ApplicationController
	before_action :logged_in_user
	def show
		user1_id,user2_id=params[:id].split(',')
		if user2_id
			if User.find_by_id(user1_id) && User.find_by_id(user2_id)
				if current_user.id==user1_id.to_i
					puts "===================0"
					@conversation=current_user.conversations.includes(:messages).where("user1_id = ? OR user2_id = ?",user2_id,user2_id).first
					unless @conversation
						@conversation=Conversation.create(user1_id: current_user.id,user2_id: user2_id)
					end
					@conversation.update(not_see_user_id: nil)
					@sender=current_user
					@receiver= (@sender==@conversation.user1 ? @conversation.user2 : @conversation.user1)
					render layout: false
				elsif current_user.id==user2_id.to_i
					puts "===================1"
					@conversation=current_user.conversations.includes(:messages).where("user1_id = ? OR user2_id = ?",user1_id,user1_id).first
					unless @conversation
						@conversation=Conversation.create(user1_id: current_user.id,user2_id: user1_id)
					end
					@conversation.update(not_see_user_id: nil)
					@sender=current_user
					@receiver= (@sender==@conversation.user1 ? @conversation.user2 : @conversation.user1)
					render layout: false
				else
					puts "===================2"
					flash[:danger]="Is not current_user"
					redirect_to root_path
				end
			else#if User.find_by_id(us...
				puts "===================3"
				flash[:danger]="User is not exist"
				redirect_to root_path
			end
		else#if user2_id			
			@conversation=Conversation.find_by_id(user1_id)
			if @conversation
				puts "===================4"
				@conversation.update(not_see_user_id: nil)
				@sender=current_user
				@receiver= (@sender==@conversation.user1 ? @conversation.user2 : @conversation.user1)
				render layout: false
			else
				puts "===================5"
				flash[:danger]="Conversation not found"
				redirect_to root_path
			end
		end
		def update
			conversation=Conversation.find_by_id(params[:id])	
			conversation.update(not_see_user_id: nil) if conversation	
		end				
	end	
	private
	def conversation_params
		params.require(:conversation).permit(:user1_id,:user2_id)
	end
end
