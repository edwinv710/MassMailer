class AddVistCountToEmailSubmissions < ActiveRecord::Migration
  def change
    add_column :email_submissions, :visit_count, :integer, :default => 0
  end
end
