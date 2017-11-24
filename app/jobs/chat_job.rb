class ChatJob < ApplicationJob
  queue_as :default

  def perform(sender,receiver)       
    ActionCable.server.broadcast "user_#{receiver.id}",
    	sender_id: sender.id     
  end
end
