class AddEmailSubmissionIdToListMail < ActiveRecord::Migration
  def change
    add_column :list_mails, :email_submission_id, :string
  end
end
