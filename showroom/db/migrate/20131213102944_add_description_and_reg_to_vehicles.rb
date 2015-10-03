class AddDescriptionAndRegToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :description, :string
    add_column :vehicles, :reg, :string
  end
end
