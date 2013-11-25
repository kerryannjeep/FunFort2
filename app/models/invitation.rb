class Invitation < ActiveRecord::Base
  attr_accessible :child_id, :secret_code, :expiry_date, :status, :message_id

  belongs_to :child
  belongs_to :message


  after_initialize do
    self.status = 'Created' unless self.status
  end
end
