class AddServerIdToListMail < ActiveRecord::Migration
  def change
    add_column :list_mails, :server_id, :string
    add_column :email_submissions, :list_mail_id, :string
  end
end
