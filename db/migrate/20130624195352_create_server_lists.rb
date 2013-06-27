class CreateServerLists < ActiveRecord::Migration
  def change
    create_table :server_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
