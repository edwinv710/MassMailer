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
  attr_accessible :email_id, :email_message_id, :server_id, :delivered, :priority, :email
  has_one :email
  has_one :email_message
  has_one :server
  
=begin  
	Method: 
		deliver
	Function:
		Sends the email created
=end  

  def deliver
  	server = Server.find(server_id)
  	email = Email.find(email_id)
  	message = EmailMessage.find(email_message_id)
  	UserMailer.send_email(server, email, message).deliver
  	delivered = true
  	#Email.find(email_id).count = Email.find(email_id).count + 1
  end

end
