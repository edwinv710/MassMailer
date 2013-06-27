class CreateEmailSubmissions < ActiveRecord::Migration
  def change
    create_table :email_submissions do |t|
      t.string :email_id
      t.string :email_message_id

      t.timestamps
    end
  end
end
