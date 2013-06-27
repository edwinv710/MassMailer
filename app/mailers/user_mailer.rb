class UserMailer < ActionMailer::Base
  default from: "edwin.velasquez89@gmail.com"

  def send_email(server_id, email_id, email_message_id)
  	@server = Server.find(server_id)

  	ActionMailer::Base.raise_delivery_errors = true
  	ActionMailer::Base.smtp_settings = {
    :address              => @server.address,
    :port                 => @server.port,
    :user_name            => @server.user_name,
    :password             => @server.server_password,
    :authentication       => @server.authentication,
    enable_starttls_auto: true
  	}

  	@email = Email.find(email_id)
  	@message = EmailMessage.find(email_message_id)

  	mail to: @email.emailAddress, subject: @message.subject
  end

end
