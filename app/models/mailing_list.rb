class MailingList < ActiveRecord::Base
  attr_accessible :name, :description, :email_tokens, :email_ids
  has_and_belongs_to_many :emails
  
  
end
