class CreateAccounts < ActiveRecord::Migration[5.1]
  def up
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :discord_name
      t.integer :type, default: 0 # Default to CMDR
      t.integer :credits, default: 0
      t.timestamps null: false
    end
    add_index :accounts, :name
    add_index :accounts, :type

    create_table :trade_events do |t|
      t.text :content, null: false
      t.integer :user_id
      t.integer :account_id, null: false
      t.timestamps null: false
    end
    add_index :trade_events, :user_id
    add_index :trade_events, :account_id
  end

  def down
    remove_index :accounts, :name
    remove_index :accounts, :type
    drop_table :accounts

    remove_index :trade_events, :user_id
    remove_index :trade_events, :account_id
    drop_table :trade_events
  end
end
