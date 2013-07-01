class AddMaxEmailsToServers < ActiveRecord::Migration
  def change
    add_column :servers, :max_emails, :integer, :default => 0
  end
end
