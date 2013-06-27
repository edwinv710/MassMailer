class AddLabelToEmailMessages < ActiveRecord::Migration
  def change
    add_column :email_messages, :label, :string
  end
end
