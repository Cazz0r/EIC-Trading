class AddLocationToOrder < ActiveRecord::Migration[5.1]
  def change
    change_table :orders do | t |
      t.integer :location, default: 0
    end
  end
end
