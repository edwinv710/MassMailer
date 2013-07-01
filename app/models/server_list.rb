=begin
	ServerList:
		Contains a list of servers

	TODO:
		Work on this after list submission is completed
=end

class ServerList < ActiveRecord::Base
  attr_accessible :name, :server_ids
  has_and_belongs_to_many :servers


end
