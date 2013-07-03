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
   attr_accessible :completed,:email_submission_ids, :message_id , :mailing_list_id, :server_id, :name, :priority, :server_list_id
   has_many :email_submissions


   def init
   	self.completed = false
   	self.priority = 5
   	if ((self.name == nil) || (self.name == ""))
   		self.name = "Test Mass Mail #{self.id}"
   	end
   end

=begin
	Method: addSubmission
		Created a Mass Mail that can be sent at any point 
=end
	def addSubmissions(email_id, server_list_id, message_id, priority = 5)
		MailingList.find(email_id).emails.each do |e|
			submission = EmailSubmission.new(:email_id => e.id,  :email_message_id => message_id, :priority => priority)
			email_submissions <<  submission
			submission.save
		end
	end 



	def select_random_server(slist)	
		offset = rand(slist.servers.count)
		
		if offset > 0
			slist.servers.first(:offset => offset)
		else
			false
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