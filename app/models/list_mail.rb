=begin

ListMail:
	ListMail sends a message to a list of email address from a list of servers. 

Database variables:
	:email_submissions (readable)
		Email that is ready to be sent. It contains emails, servers,
		and message to be sent. 
	:completed (r)
		Returns true if all the message were sent

	TODO:
		Add any variable that are not in the schema
		Delete all the variables that are not in use.
=end

class ListMail < ActiveRecord::Base
   attr_accessor :completed
   attr_readable :email_submissions

=begin
	Method: addSubmission
		Created a Mass Mail that can be sent at any point 
=end
	def addSubmission(email_id, server_id, message_id, priority = 5)
		if email.instance_of?(Email)
			params => {:email_id => email_id, :server_id => server_id, :message_id => message_id, :priority => priority_id}
			submission = EmailSubmission.new(params)
			:email_submissions << submission 
		else
			MailingList.find(email_id).emails.each do |e|
				params => {:email_id => e.id, :server_id => server_id, :message_id => message_id, :priority => priority_id}
				submission = EmailSubmission.new(params)
				:email_submissions << submission 
			end
		end
	end 



=begin
	Method: deliver
		Deliver all email submissions
=end
   def deliver
   		email_submissions.each do |e|
   			e.deliver
   		end
   end
end
