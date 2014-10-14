class CreateWishLists < ActiveRecord::Migration
  def change
    create_table :wish_lists do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :location
      t.references :user
      t.string :condition
      t.integer :quantity
      t.decimal :length
      t.decimal :width
      t.decimal :height
      t.decimal :price
      t.decimal :weight
      t.date :available_until

      t.timestamps
    end
    add_index :wish_lists, :user_id
  end
end
