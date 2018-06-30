class AddQuantityAndCommodityToOrders < ActiveRecord::Migration[5.1]
  def up
    add_column :orders, :order_quantity, :integer
    add_column :orders, :order_commodity, :text
  end

  def down
    remove_column :orders, :order_quantity
    remove_column :orders, :order_commodity
  end
end
