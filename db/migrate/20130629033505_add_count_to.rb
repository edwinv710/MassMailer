class AddCountTo < ActiveRecord::Migration
  def up
  	add_column :emails, :count, :integer
  end

  def down
  end
end
