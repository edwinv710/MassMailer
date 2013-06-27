class AddDeliveredToEmailSubmission < ActiveRecord::Migration
  def change
    add_column :email_submissions, :delivered, :boolean
  end
end
