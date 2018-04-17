class AddAdminToUsers < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :admin, :boolean, default: false
    add_index :users, :admin
  end

  def down
    remove_index :users, :admin
    remove_column :users, :admin
  end
end
