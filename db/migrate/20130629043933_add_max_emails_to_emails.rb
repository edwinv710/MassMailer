class AddMaxEmailsToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :max_emails, :integer, :default => 0
  end
end
