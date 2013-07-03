=begin
	Server:
		Contains information about the servers that are going to be used to send an email
=end

class Server < ActiveRecord::Base
  before_save :init

  has_secure_password

  has_and_belongs_to_many :server_lists

  attr_accessible :address, :authentication, :name, :password, 
  	:password_confirmation, :port, :user_name, :server_list_ids,
  	:server_password, :max_emails, :current_day, :count_day

  def init
  	current_day = DateTime.now
  	count_day = 0
  end

  def is_active?
  	if current_day.to_date === DateTime.now.to_date
  		if count_day < max_emails
  			true
  		else
  			false
  		end
  	else
  		current_day = DateTime.now
  		count_day = 0
  		true
  	end
  end


end
