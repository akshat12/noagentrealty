class ChangeOldProperties < ActiveRecord::Migration
    def change
  	rename_table :old_items, :old_properties
  	change_table :old_properties do |op|
  		op.integer :number_of_bathrooms, :number_of_rooms, :number_of_study, :lease_duration, :user_id
  		op.rename :price, :rent
  		op.rename :category, :property_type
 		op.string :postal_code, :unit_number
 		op.boolean :furnished?
  		op.remove :length, :width, :height, :weight, :available_until, :quantity, :condition
  end
end
end
