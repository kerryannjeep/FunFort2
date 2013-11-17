class Parent < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
  has_many :children

  has_secure_password
  validates_uniqueness_of :email

  def name
    self.first_name + ' ' + self.last_name
  end
end
