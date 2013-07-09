class AddTotalVistCountToEmailSubmissions < ActiveRecord::Migration
  def change
    add_column :list_mails, :total_visit_count, :integer, :default => 0
  end
end
