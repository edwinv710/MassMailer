class AddDescriptionToMailingLists < ActiveRecord::Migration
  def change
    add_column :mailing_lists, :description, :string
  end
end
