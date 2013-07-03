class AddServerListIdToEmailSubmissions < ActiveRecord::Migration
  def change
  	add_column :email_submissions, :server_list_id, :string
  end
end
