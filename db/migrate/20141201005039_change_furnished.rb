class ChangeFurnished < ActiveRecord::Migration
  def change
  	change_table :rental_properties do |rp|
		rp.rename :furnished?, :furnished
	end

	change_table :old_properties do |op|
		op.rename :furnished?, :furnished
	end
  end
end
