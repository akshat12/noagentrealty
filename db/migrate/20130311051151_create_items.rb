class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.text :description
      t.references :user
      t.string :image
      t.integer :quantity
      t.string :condition
      t.decimal :length
      t.decimal :width
      t.decimal :height
      t.decimal :price
      t.date :available_from
      t.date :available_until
      t.decimal :weight

      t.timestamps
    end
    add_index :items, :user_id
  end
end
