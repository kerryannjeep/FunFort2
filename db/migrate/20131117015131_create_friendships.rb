class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :child1_id
      t.integer :child2_id

      t.timestamps
    end
  end
end
