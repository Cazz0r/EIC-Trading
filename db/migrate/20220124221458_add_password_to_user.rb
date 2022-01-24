class AddPasswordToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :password_digest
      t.string :pw_salt
    end
  end
end
