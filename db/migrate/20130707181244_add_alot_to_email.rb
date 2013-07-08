class AddAlotToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :company, :string
    add_column :emails, :address, :string
    add_column :emails, :city, :string
    add_column :emails, :state, :string
    add_column :emails, :zip, :integer
    add_column :emails, :fist_name, :string
    add_column :emails, :last_name, :string
    add_column :emails, :gender, :string
    add_column :emails, :title, :string
  end
end
