class AddInvitationToMessage < ActiveRecord::Migration
  def change
    add_reference :messages, :invitition, index: true
  end
end
