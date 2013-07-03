class AddCurrentDayToServer < ActiveRecord::Migration
  def change
    add_column :servers, :current_day, :datetime
    add_column :servers,   :count_day, :integer
  end
end
