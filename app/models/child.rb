class Child < ActiveRecord::Base
  attr_accessible :first_name, :parent_id

  belongs_to :parent
  has_many :friendships
  has_many :messages
  has_many :received_messages, -> { where friend_parent_approval: true }, class_name: "Message", foreign_key: "friend_id"
  has_many :friends, :through => :friendships
end
