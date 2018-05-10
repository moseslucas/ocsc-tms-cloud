class RemoveIndexThatAreNotIds < ActiveRecord::Migration[5.2]
  def change
    remove_index :calculations, name: "index_calculations"
    remove_index :locations, name: "index_locations_on_name"
    remove_index :uoms, name: "index_uoms_on_measurement"
    remove_index :users, name: "index_users_on_name"
  end
end
