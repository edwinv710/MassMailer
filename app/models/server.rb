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
  	:server_password, :max_emails, :current_day, :count_day, :host

  validates  :authentication, :name,   
    :port, :user_name, :server_password, :max_emails, :host, presence: true

  validates :max_emails, numericality: {greater_than_or_equal_to: 0}



  def init
  	self.current_day = DateTime.now
  	self.count_day = 0
  end

  def isactive?
    value = true
  	if current_day.to_date === DateTime.now.to_date
  		if count_day < max_emails
  			value = true
  		else
  			value = false
  		end
  	else
  		self.current_day = DateTime.now
  		self.count_day = 0
  		value = true
  	end
    value
  end


end
