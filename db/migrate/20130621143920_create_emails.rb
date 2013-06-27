class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :emailAddress
      t.string :user_id

      t.timestamps
    end
  end
end
