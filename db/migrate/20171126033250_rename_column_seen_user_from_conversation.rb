class RenameColumnSeenUserFromConversation < ActiveRecord::Migration[5.0]
  def change
  	rename_column :conversations,:seenuser_id,:not_see_user_id
  end
end
