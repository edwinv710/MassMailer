class AddIsActiveToServer < ActiveRecord::Migration
  def change
    add_column :servers, :is_active, :boolean
  end
end
