class CreateUoms < ActiveRecord::Migration[5.1]
  def change
    create_table :uoms, {id: false} do |t|
      t.column :id, "varchar(100) PRIMARY KEY"
      t.string   :measurement, null: false
      t.string   :description
      t.integer  :status, limit: 1, default: 1
      t.index [:measurement], name: "index_uoms_on_measurement", unique: true, using: :btree

      t.string :branch, array:true, default: ["master"]
      t.string :id_from_branch, array:true, default:[]

      t.timestamps
    end
  end
end
