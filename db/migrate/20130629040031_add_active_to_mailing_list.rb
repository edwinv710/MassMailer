class AddActiveToMailingList < ActiveRecord::Migration
  def change
    add_column :mailing_lists, :active, :boolean, :default => false
  end
end
