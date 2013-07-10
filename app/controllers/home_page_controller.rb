class HomePageController < ApplicationController
  before_filter :authenticate_user!
  def send_mail
  	@emails = Email.all
  	@messages = EmailMessage.all

  		
  end
end
