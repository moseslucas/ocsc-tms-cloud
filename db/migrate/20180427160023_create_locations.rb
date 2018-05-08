class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations, {id: false} do |t|
      t.column :id, "varchar(100) PRIMARY KEY"
      t.string :company_id
      t.string :name, limit: 100, unique:true
      t.string :description, null:true
      t.string :location_type, limit: 50
      t.integer :status, limit: 1, default:1

      #index
      t.index ["name"], name: "index_locations_on_name", unique: true, using: :btree

      t.string :branch, array:true, default: ["master"]
      t.string :id_from_branch, array:true, default:[]

      t.timestamps
    end
  end
end
