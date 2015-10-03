class CreateFueltypes < ActiveRecord::Migration
  def change
    create_table :fueltypes do |t|
      t.string :fuel_type

      t.timestamps
    end
  end
end
