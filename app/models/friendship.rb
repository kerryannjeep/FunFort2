class Friendship < ActiveRecord::Base

  attr_accessible :child_id, :friend_id
  has_many :messages

  belongs_to :child
  belongs_to :friend, :class_name => "Child"

  def friend_name
    self.friend.first_name
  end

end
