class ChangeIsActiveInServer < ActiveRecord::Migration
  def up
  	change_column :servers, :is_active, :boolean, :default => true
  end

  def down
  end
end
