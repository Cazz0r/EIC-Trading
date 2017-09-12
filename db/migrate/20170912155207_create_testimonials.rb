class CreateTestimonials < ActiveRecord::Migration[5.1]
  def up
    create_table :testimonials do |t|
    	t.text :content, null: false
    	t.integer :account_id
    	t.integer :order_id
    	t.timestamps null: false
    end
    add_index :testimonials, :account_id
    add_index :testimonials, :order_id
  end

  def down
  	remove_index :testimonials, :account_id
  	remove_index :testimonials, :order_id
  	drop_table :testimonials
  end
end
