class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :friendship_id
      t.string :data
      t.boolean :parent_approval
      t.boolean :friend_parent_approval
      t.datetime :expiry_date
      t.integer :child_id

      t.timestamps
    end
  end
end
