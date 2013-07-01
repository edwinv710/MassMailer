=begin
	Server:
		Contains information about the servers that are going to be used to send an email
=end

class Server < ActiveRecord::Base
  has_secure_password

  has_and_belongs_to_many :server_lists

  attr_accessible :address, :authentication, :name, :password, 
  	:password_confirmation, :port, :user_name, :server_list_ids,
  	:server_password, :max_emails

end
