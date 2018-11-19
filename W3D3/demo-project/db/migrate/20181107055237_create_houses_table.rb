class CreateHousesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |house|
      house.string :address, null:false
      house.timestamps
    end
  end
end
