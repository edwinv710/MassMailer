class CreateFirsts < ActiveRecord::Migration
  def change
    create_table :firsts do |t|
      t.string :firstname

      t.timestamps
    end
  end
end
