class ChangeTradeEventAccountRules < ActiveRecord::Migration[5.1]
  def up
  	change_column :trade_events, :account_id, :integer, null: true
  end

  def down
  	change_column :trade_events, :account_id, :integer, null: false
  end
end
