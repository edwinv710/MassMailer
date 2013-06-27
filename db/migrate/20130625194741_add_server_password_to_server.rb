class AddServerPasswordToServer < ActiveRecord::Migration
  def change
  	add_column :servers, :server_password, :string
  end
end
