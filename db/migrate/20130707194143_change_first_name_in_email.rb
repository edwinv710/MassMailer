class ChangeFirstNameInEmail < ActiveRecord::Migration
  def up
  	drop_table :emails
  end

  def down
  end
end
