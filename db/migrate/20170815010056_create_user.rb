class CreateUser < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
      t.string :username
      t.text :image_url
      t.string :rank
      t.string :tags
      t.timestamps null: false
    end
    add_index :users, :username
    add_index :users, :rank
  end

  def down
    remove_index :users, :username
    remove_index :users, :rank
    drop_table :users
  end
end