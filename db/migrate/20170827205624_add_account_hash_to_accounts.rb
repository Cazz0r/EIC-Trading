class AddAccountHashToAccounts < ActiveRecord::Migration[5.1]
  def up
    add_column :accounts, :account_hash, :string
    add_index :accounts, :account_hash
  end

  def down
    remove_index :accounts, :account_hash
    remove_column :accounts, :account_hash
  end
end