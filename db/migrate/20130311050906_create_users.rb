class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_token
      t.string :image
      t.boolean :admin, :default => false
      t.boolean :banned, :default => false
      t.boolean :confirmed, :default => false
      t.string :confirm_code
      t.string :password_reset_token
      t.datetime :password_reset_sent_at

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :remember_token
  end
end