class AddServerListIdToServer < ActiveRecord::Migration
  def change
    add_column :servers, :server_list_id, :string
  end
end
