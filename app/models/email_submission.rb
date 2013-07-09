=begin

ListMail:
	Email submission send an email to the given email address with a message from a specified server 

Database variables:
	:email
		The email that the message is going to be sent to
	:email_message
		The message that is going to be sent to the given email
	:server
		The server where the email is going to be sent from
	:delivered
		Returns true if the email was sent
	:priority
		he closer the number is to zero, the more precedence the submission has
Relations
	:email(has_one)
		Each submission has one email
	:email_message(has_one)
		Each submission has one email message
	:server(has_one)
		Each submission has one server

TODO:
	Add any variable not in the schema
	Delete any variable not in use
=end

class EmailSubmission < ActiveRecord::Base
  attr_accessible :email_id, :email_message_id, :server_id, :isdelivered, :priority, :email, :list_mail_id, :visit_count
  has_one :email
  has_one :email_message
  has_one :server
  has_one :server_list
  belongs_to :list_mail

  validates :email_id, :email_message_id,  presence: true
  validates :priority, numericality: {:greater_than_or_equal_to => 0}

  def init
  	unless priority
  		self.priority = 5
  	end

  end

  def email_address
    Email.find(email_id).emailAddress
  end
  
=begin  
	Method: 
		deliver
	Function:
		Sends the email created
=end  

	
  def self.deliver(id)
    find(id).deliver
  end

  def deliver
 	return_value = false
  	if list_mail_id != nil
  		set_new_server
  	end
  	server = Server.find(server_id)
  	email = Email.find(email_id)
  	message = EmailMessage.find(email_message_id)
  	#debugger
  	if server.isactive? == true && email.subscribed == true
  		if UserMailer.send_email(server, email, message).deliver
	  		update_attribute(:isdelivered, true)
	  		server.update_attribute(:count_day, (server.count_day + 1))
        unless email.count.nil?
	  		 email.update_attribute(:count, (email.count + 1))
        else
         email.count = 1
         email.save  
        end
	  		return_value = true
  		end
  	end
  	return_value
  	#Email.find(email_id).count = Email.find(email_id).count + 1
  end

  def set_new_server
  	list = ServerList.find(ListMail.find(list_mail_id).server_list_id)
  	temp_servers = list.get_active_servers
  	temp_server = select_random_server(list)
  	if temp_server != false
  		update_attribute(:server_id, temp_server.id)
  	else
  		false
  	end
  end

  def select_random_server(slist)	
  		#debugger
  		count = slist.servers.count
		offset = rand(count)
		
		if count > 0
			slist.servers.first(:offset => offset)
		else
			false
		end
	end

end
