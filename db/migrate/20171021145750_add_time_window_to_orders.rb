class AddTimeWindowToOrders < ActiveRecord::Migration[5.1]
  def up
  	add_column :orders, :time_window, :integer, default: 0
    add_index :orders, :time_window
  end

  def down
  	remove_index :orders, :time_window
    remove_column :orders, :time_window
  end
end
