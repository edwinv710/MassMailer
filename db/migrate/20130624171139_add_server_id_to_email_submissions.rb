class AddServerIdToEmailSubmissions < ActiveRecord::Migration
  def change
    add_column :email_submissions, :server_id, :string
  end
end
