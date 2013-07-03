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
  attr_accessible :email_id, :email_message_id, :server_id, :delivered, :priority, :email, :list_mail_id
  has_one :email
  has_one :email_message
  has_one :server
  has_one :server_list
  belongs_to :list_mail
  
=begin  
	Method: 
		deliver
	Function:
		Sends the email created
=end  

  def deliver
  	if list_mail_id
  		set_new_server
  	end
  	server = Server.find(server_id)
  	email = Email.find(email_id)
  	message = EmailMessage.find(email_message_id)
  	if server.is_active?
  		UserMailer.send_email(server, email, message).deliver
  		delivered = true
  		server.count_day = server.count_day + 1
  	end
  	#Email.find(email_id).count = Email.find(email_id).count + 1
  end

  def set_new_server
  	list = ServerList.find(ListMail.find(list_mail_id).server_list_id)
  	temp_servers = list.get_active_servers
  	temp_server = select_random_server(list)
  	if temp_server
  		server_id = temp_server_id
  	else
  		false
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

end
