class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :name
      t.boolean :preference_value
      t.references :user

      t.timestamps
    end
    add_index :preferences, :user_id
  end
end
