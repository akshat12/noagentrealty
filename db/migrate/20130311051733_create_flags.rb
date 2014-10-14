class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.string :reason
      t.text :comment
      t.references :flaggable, :polymorphic => true
      t.references :user

      t.timestamps
    end
    add_index :flags, :user_id
  end
end