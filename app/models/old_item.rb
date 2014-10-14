# app/models/old_item.rb

class OldItem < ActiveRecord::Base
	attr_accessible :available_from, :available_until, :category, :condition, :description, :height, :length, :name, :price, :quantity, :reason, :weight, :width

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
