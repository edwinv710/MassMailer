class UserMailer < ActionMailer::Base
  default from: "Dave.Ram.Stickney@yahoo.com"

  def send_email(server_id, email_id, email_message_id)
  	@server = Server.find(server_id)


  	ActionMailer::Base.raise_delivery_errors = true
  	ActionMailer::Base.smtp_settings = {
    :from                 => "Dave.Ram.Stickney@yahoo.com"
    :address              => @server.address,
    :domain               => @server.host,
    :port                 => @server.port,
    :user_name            => @server.user_name,
    :password             => @server.server_password,
    :authentication       => @server.authentication,
    :enable_starttls_auto => @server.tls

    }

  	@email = Email.find(email_id)
  	@message = EmailMessage.find(email_message_id)

  	mail to: @email.emailAddress, subject: @message.subject, from: "Dave.Ram.Stickney@yahoo.com"
  end

end
