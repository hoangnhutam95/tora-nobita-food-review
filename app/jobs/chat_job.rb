class ChatJob < ApplicationJob
  queue_as :default

  def perform(message)
  	sender_id=message.user.try(:id)
  	conversation=message.conversation
  	receiver_id=(sender_id==conversation.user1.id ? conversation.user2.id : conversation.user1.id)   
    ActionCable.server.broadcast "user_#{sender_id}",
    	type: "message",
    	who: "sender",
    	conversation: conversation.id,
    	body: ApplicationController.renderer.render(message) 
    ActionCable.server.broadcast "user_#{receiver_id}",
    	type: "message",
    	who: "receiver",
    	conversation: conversation.id,
    	body: ApplicationController.renderer.render(message)    
  end
end
