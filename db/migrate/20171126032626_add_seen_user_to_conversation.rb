class AddSeenUserToConversation < ActiveRecord::Migration[5.0]
  def change
    add_reference :conversations, :seenuser, foreign_key: true
  end
end
