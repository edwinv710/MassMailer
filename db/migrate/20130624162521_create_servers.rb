class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.string :address
      t.integer :port
      t.string :authentication
      t.string :user_name
      t.string :password_digest

      t.timestamps
    end
  end
end
