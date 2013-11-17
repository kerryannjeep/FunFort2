class Child < ActiveRecord::Base
  attr_accessible :first_name, :parent_id
  belongs_to :parent
  has_many :friends, through: :friendship
end
