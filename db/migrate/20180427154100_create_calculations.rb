class CreateCalculations < ActiveRecord::Migration[5.1]
  def change
    create_table :calculations, {id: false} do |t|
      t.column :id, "varchar(100) PRIMARY KEY"
      t.string   :name, null: false
      t.string   :description
      t.string   :uom_id, limit: 30
      t.decimal  :charge, precision: 9, scale: 2
      t.decimal  :puc, precision: 9, scale: 2
      t.decimal  :min_weight, precision: 9, scale: 2
      t.decimal  :mwc, precision: 9, scale: 2
      t.integer  :status, limit: 1, default: 1
      t.integer  :valuation, default: 0
      t.integer  :tax, default: 0
      t.string   :calculation_type, limit: 100, default: "cargo", null: false
      t.index [:name], name: "index_calculations", unique: true, using: :btree

      t.string :branch, array:true, default: ["master"]
      t.string :id_from_branch, array:true, default:[]

      t.timestamps
    end
  end
end
