class ChangeFistNameInEmail < ActiveRecord::Migration
  def u
  	change_column :email, :fist_name, :first_name
  end

  def down
  end
end
