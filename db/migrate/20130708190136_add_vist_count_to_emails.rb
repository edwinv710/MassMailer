class AddVistCountToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :visit_count, :integer, :default => 0
  end
end
