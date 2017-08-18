class ChangeTypeOnAccounts < ActiveRecord::Migration[5.1]
  def up
    remove_index :accounts, :type
    remove_column :accounts, :type

    add_column :accounts, :account_type, :integer
    add_index :accounts, :account_type
  end

  def down
    remove_index :accounts, :account_type
    remove_column :accounts, :account_type

    add_column :accounts, :type, :integer
    add_index :accounts, :type
  end
end
