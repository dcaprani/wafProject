class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.string :colour
      t.integer :miles
      t.integer :owners
      t.decimal :price
      t.string :image

      t.timestamps
    end
  end
end
