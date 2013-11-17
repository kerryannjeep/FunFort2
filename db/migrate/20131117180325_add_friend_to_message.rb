class AddFriendToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :friend_id, :integer
  end
end
