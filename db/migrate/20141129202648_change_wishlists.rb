class ChangeWishlists < ActiveRecord::Migration
  def change
  	change_table :wish_lists do |w|
  		w.integer :number_of_bathrooms, :number_of_rooms, :number_of_study, :lease_duration
  		w.rename :price, :rent
  		w.rename :category, :property_type
 		w.string :postal_code, :unit_number
 		w.boolean :furnished?
  		w.remove :length, :width, :height, :weight, :available_until, :quantity, :condition
  	end
  end
end
