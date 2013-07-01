class RemoveMaxEmailsToEmails < ActiveRecord::Migration
  def up
  	remove_column :emails, :max_emails
  end

  def down
  end
end
