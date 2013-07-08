=begin
	EmailMessage
		The email message to be sent

	Database Variables 
		label:
			Name of the email message
		subject:
			Subject of the email
		html:
			Message of the email
=end

class EmailMessage < ActiveRecord::Base
   attr_accessible :label, :subject, :html

   validates :label, :subject, presence: true
 


end
