class AddSubjectToEmailMessages < ActiveRecord::Migration
  def change
    add_column :email_messages, :subject, :string
  end
end
