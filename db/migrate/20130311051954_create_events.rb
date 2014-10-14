class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.date :event_date
      t.time :start_time
      t.time :end_time
      t.string :image
      t.references :user

      t.timestamps
    end
    add_index :events, :user_id
  end
end
