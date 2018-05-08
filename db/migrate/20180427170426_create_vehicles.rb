class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles, {id: false} do |t|
      t.column :id, "varchar(100) PRIMARY KEY"
      t.string   :ref_id, null: false
      t.string   :description
      t.string   :vehicle_type
      t.integer  :status, limit: 1, default: 1

      t.string :branch, array:true, default: ["master"]
      t.string :id_from_branch, array:true, default:[]

      t.timestamps
    end
  end
end
