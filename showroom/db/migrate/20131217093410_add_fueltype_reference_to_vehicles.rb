class AddFueltypeReferenceToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :fueltype, :references
  end
end
