class CreateServerListsServersJoin < ActiveRecord::Migration
    def up
  	create_table 'server_lists_servers', :id => false do |t|
  		t.column 'server_list_id', :integer
  		t.column 'server_id', :integer
  	end
  end

  def down
  	drop_table 'server_lists_servers'
  end
end
