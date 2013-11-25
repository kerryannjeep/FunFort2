class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :child, index: true
      t.string :secret_code
      t.datetime :expiry_date
      t.string :status
      t.references :message, index: true

      t.timestamps
    end
  end
end
