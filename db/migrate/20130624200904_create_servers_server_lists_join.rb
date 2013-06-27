class CreateServersServerListsJoin < ActiveRecord::Migration
  def up
  	create_table 'servers_server_lists', :id => false do |t|
  		t.column 'server_id', :integer
  		t.column 'server_list_id', :integer
  	end
  end

  def down
  	drop_table 'servers_server_lists'
  end
end
