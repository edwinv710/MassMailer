class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :firstName
      t.string :lastName

      t.timestamps
    end
  end
end
