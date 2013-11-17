class AddFriendToFriendship < ActiveRecord::Migration
  def change
    add_column :friendships, :child_id, :integer
    add_column :friendships, :friend_id, :integer
    remove_column :friendships, :child1_id
    remove_column :friendships, :child2_id
  end
end
