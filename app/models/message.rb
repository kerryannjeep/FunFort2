class Message < ActiveRecord::Base
  attr_accessible :friendship_id, :data, :parent_approval, :friend_parent_approval, :expiry_date, :child_id, :friend_id
  belongs_to :friendship
  belongs_to :child
  belongs_to :friend, :class_name => "Child"

  after_initialize do
    self.parent_approval = false unless self.parent_approval
    self.friend_parent_approval = false unless self.friend_parent_approval
    self.expiry_date = 10.days.from_now unless self.expiry_date
  end
end
