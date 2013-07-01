class AddDefaultToDelivered < ActiveRecord::Migration
  def change
  	rename_column :email_submissions, :delivered, :isdelivered
  	change_column :email_submissions, :isdelivered, :boolean, :default => false
  end
end
