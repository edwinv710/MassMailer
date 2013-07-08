=begin
	ServerList:
		Contains a list of servers

	TODO:
		Work on this after list submission is completed
=end

class ServerList < ActiveRecord::Base
  attr_accessible :name, :server_ids, :servers
  has_and_belongs_to_many :servers

  validates :name, presence: true

  def add_server(server_id)
  	unless server_ids.include?(server_id)
  		server_ids << server_id
  	else
  		false
  	end
  end

  def get_active_servers
	servers_return = Array.new

	servers.each do |s|
		if s.is_active?
			servers_return << s
		end
	end

	servers_return
  end


 def remove_servers(serverids)
    serverids.each do |e|
          servers.delete(Server.find(e))
    end  
  end

  def add_servers(serverids)
    serverids.each do |sid|
      server =  Server.find(sid)
      unless servers.include?(server)
        servers << server
      end
    end
  end
  	


end
