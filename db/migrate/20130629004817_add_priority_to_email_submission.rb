class AddPriorityToEmailSubmission < ActiveRecord::Migration
  def change
    add_column :email_submissions, :priority, :integer
  end
end
