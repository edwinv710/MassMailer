class AddTlsToServer < ActiveRecord::Migration
  def change
    add_column :servers, :tls, :boolean
  end
end
