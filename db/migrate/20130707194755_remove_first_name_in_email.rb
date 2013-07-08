class RemoveFirstNameInEmail < ActiveRecord::Migration
  def up
  	create_table :emails do |t|
      t.string :emailAddress
      t.string :user_id
      t.timestamps
  	end
  end

  def down
  end
end
