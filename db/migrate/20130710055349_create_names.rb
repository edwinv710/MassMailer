class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :name
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
