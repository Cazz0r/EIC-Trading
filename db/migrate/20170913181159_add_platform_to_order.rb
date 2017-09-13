class AddPlatformToOrder < ActiveRecord::Migration[5.1]
  def up
  	add_column :orders, :platform, :integer, default: 0
    add_index :orders, :platform
  end

  def down
  	remove_index :orders, :platform
    remove_column :orders, :platform
  end
end
