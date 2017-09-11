class CreateOrders < ActiveRecord::Migration[5.1]
  def up
    create_table :orders do |t|
      t.string :description
      t.string :order_hash
      t.integer :account_id, null: :false
      t.integer :user_id, null: :false
      t.integer :order_type, default: 0 # Default to order
      t.integer :status, default: 0 # Default to open
      t.timestamps null: false
    end
    add_index :orders, :account_id
    add_index :orders, :user_id
    add_index :orders, :order_type
    add_index :orders, :status
    add_index :orders, :order_hash

    add_column :trade_events, :order_id, :integer
    add_index :trade_events, :order_id
  end

  def down
  	remove_index :orders, :account_id
    remove_index :orders, :user_id
    remove_index :orders, :order_type
    remove_index :orders, :status
    remove_index :orders, :order_hash
  	drop_table :orders

  	remove_index :trade_events, :order_id
    remove_column :trade_events, :order_id
  end
end
