class Friendship < ActiveRecord::Base

  attr_accessible :child1_id, :child2_id

  belongs_to :child1, class_name: "Child"
  belongs_to :child2, class_name: "Child"

end
