class EmailSubmission < ActiveRecord::Base
  attr_accessible :email_id, :email_message_id, :server_id, :delivered
  has_one :email
  has_one :email_message
  has_one :server
  
end
