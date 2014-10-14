class CreateOldItems < ActiveRecord::Migration
  def change
    create_table :old_items do |t|
      t.string :name
      t.text :description
      t.string :category
      t.integer :quantity
      t.string :condition
      t.decimal :length
      t.decimal :width
      t.decimal :height
      t.decimal :price
      t.decimal :weight
      t.date :available_from
      t.date :available_until
      t.string :reason

      t.timestamps
    end
  end
end
