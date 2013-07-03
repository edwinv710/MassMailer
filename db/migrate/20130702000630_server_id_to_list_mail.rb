class ServerIdToListMail < ActiveRecord::Migration
  def up
  	add_column :list_mails, :server_id, :string
  end

  def down
  end
end
