class EditAttributesListMails < ActiveRecord::Migration
  def up
  	change_column :list_mails, :completed, :boolean, :default => false
  	change_column :list_mails, :priority, :integer, :default => 5
  	remove_column :list_mails, :server_id
  end

  def down
  end
end
