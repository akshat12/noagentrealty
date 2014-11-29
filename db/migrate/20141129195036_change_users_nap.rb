class ChangeUsersNap < ActiveRecord::Migration
  def change
  	change_table :users do |u|
  		u.rename :name, :first_name
  		u.string :middle_name, :last_name, :telephone_number, :user_type
  end
end
end