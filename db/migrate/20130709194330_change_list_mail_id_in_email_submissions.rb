class ChangeListMailIdInEmailSubmissions < ActiveRecord::Migration
  def up
  	change_column :email_submissions, :list_mail_id, :integer
  end

  def down
  end
end
