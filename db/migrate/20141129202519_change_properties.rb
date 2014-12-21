class ChangeItems < ActiveRecord::Migration
  def change
  	change_table :items do |p|
  		p.integer :number_of_bathrooms, :number_of_rooms, :number_of_study, :lease_duration
  		p.rename :price, :rent
  		p.rename :category, :property_type
 		p.string :postal_code, :unit_number
 		p.boolean :furnished
  		p.remove :length, :width, :height, :weight, :available_until, :quantity, :condition
  end
end
end
