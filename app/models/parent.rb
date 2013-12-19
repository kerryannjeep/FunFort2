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
  def parent.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def parent.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = Parent.encrypt(Parent.new_remember_token)
  end
end
end
