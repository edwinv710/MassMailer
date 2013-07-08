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
   attr_accessible :completed,:email_submission_ids, :message_id , :mailing_list_id, :server_id, :name, :priority, 
   	:server_list_id, :email_submissions, :count
   has_many :email_submissions
   validates :priority, numericality: {:greater_than_or_equal_to => 0}

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
			submission = EmailSubmission.new
			submission.email_id = e.id
			submission.email_message_id = message_id
			submission.priority = priority
			submission.list_mail_id = self.id
			#params = [:email_id => e.id,  :email_message_id => message_id, :priority => priority, :list_mail_id => self.id]
			#submission.attributes = params
			submission.save
			email_submissions <<  submission
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
	   		if e.isdelivered == false
	   			EmailSubmission.delay(:queue => self.name, :priority => self.priority).deliver(e.id)
	   		end
	   	end
	end

	def amount_delivered
		count = 0
		email_submissions.each do |e|
			if e.isdelivered
				count = count + 1
			end
		end
		count
	end

	def total_submissions
		email_submissions.count
	end

	def completed?
		return_value = false
		if MailingList.find(mailing_list_id).emails.length == count
			return_value = true
		end
		return_value
	end

end