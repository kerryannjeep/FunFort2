class Friendship < ActiveRecord::Base

  attr_accessible :child_id, :friend_id
  has_many :messages

  belongs_to :child
  belongs_to :friend, :class_name => "Child"

  def friend_name
    self.friend.first_name
  end

  def connect_children child1, child2
    results = []
    results << child1.friendships.build({friend_id: child2.id})
    results << child2.friendships.build({friend_id: child1.id})
    results << results[0].new_friend_message
    results
  end

  def new_friend_message
    message_text = "#{self.child.first_name} and #{selffriend.first_name} are now FunFort friends!"
    self.messages.build({friend_id: self.friend_id, data: message_text})
  end

end
