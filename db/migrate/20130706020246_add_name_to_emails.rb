class AddNameToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :name, :string, :default => "None"
    add_column :emails, :subscribed, :boolean, :default => true
  end
end
