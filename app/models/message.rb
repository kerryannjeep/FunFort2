class Message < ActiveRecord::Base
  attr_accessible :friendship_id, :data, :parent_approval, :friend_parent_approval, :expiry_date, :child_id, :friend_id
  belongs_to :friendship
  belongs_to :child
  belongs_to :friend, :class_name => "Child"
  has_one :invitation

  after_initialize do
    self.parent_approval = false unless self.parent_approval
    self.friend_parent_approval = false unless self.friend_parent_approval
    self.expiry_date = 10.days.from_now unless self.expiry_date

    if self.friendship_id.present?
      self.friend_id = self.friendship.friend.id
    elsif self.friend_id.present?
      self.friendship_id = self.friendships.where(:friend_id => self.friend_id)
    end
  end
end
