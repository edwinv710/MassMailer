class HomePageController < ApplicationController
  def send_mail
  	@emails = Email.all
  	@messages = EmailMessage.all

  		
  end
end
