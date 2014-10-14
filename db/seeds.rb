# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'

# Destroys all current items and their associations in the DB
# Item.destroy_all

# Open the text file containing the seed data
open("#{Rails.root}/db/seed_data.txt") do |items|
	# Read each line of the text file
	items.read.each_line do |item|
		# Split attributes using "|"
		name, category, description, quantity, condition, length, width, height, weight, price, address, image = item.chomp.split("|")
		# Create a new item using the specified attribute values from the current line of the text file
		@item = Item.new(:name => name, :category => category, :description => description, :quantity => quantity, :condition => condition, :length => length, :width => width, :height => height, :price => price, :weight => weight)
		# Set remaining attributes for item
		@item.location = Location.new
		@item.location.address = address
		@item.user = User.first
		@item.image = open("#{Rails.root}/app/assets/images/items/#{image}")
		@item.available_from = Date.today
		@item.available_until = Date.today + 30
		# Save item to the DB
		@item.save
	end
end