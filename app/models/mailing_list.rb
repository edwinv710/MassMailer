class MailingList < ActiveRecord::Base
  attr_accessible :name, :description, :email_tokens, :email_ids
  has_and_belongs_to_many :emails
  
  def to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << emails.column_names
	    emails.each do |email|
	      csv << email.attributes.values_at(*emails.column_names)
	   	end
	  end
  end

end
