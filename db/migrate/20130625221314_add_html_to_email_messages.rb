class AddHtmlToEmailMessages < ActiveRecord::Migration
  def change
    add_column :email_messages, :html, :text
  end
end
