class Parent < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
  has_many :children

  has_secure_password
  validates :password, length: { minimum: 6}

  validates_uniqueness_of :email

  before_save {self.email = email.downcase}
  def name
    self.first_name + ' ' + self.last_name
  end
end
