class CreateLasts < ActiveRecord::Migration
  def change
    create_table :lasts do |t|
      t.string :lastname

      t.timestamps
    end
  end
end
