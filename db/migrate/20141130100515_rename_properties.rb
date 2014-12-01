class RenameProperties < ActiveRecord::Migration
  def change
  	rename_table :properties, :rental_properties
  end
end
