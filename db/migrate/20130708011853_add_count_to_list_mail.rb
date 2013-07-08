raclass AddCountToListMail < ActiveRecord::Migration
  def change
    add_column :list_mails, :count, :integer
  end
end
