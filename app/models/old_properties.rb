# app/models/old_item.rb

class OldProperties < ActiveRecord::Base
	attr_accessible :name, :property_type, :description, :available_from, :rent, :number_of_bathrooms, :number_of_rooms, :number_of_study, :lease_duration, :postal_code, :unit_number, :furnished?

	# For generating statistics about deleted items
	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |item|
				csv << item.attributes.values_at(*column_names)
			end
		end
	end
end
