class AddHostToServer < ActiveRecord::Migration
  def change
    add_column :servers, :host, :string
  end
end
