class CreateKinds < ActiveRecord::Migration[5.1]
  def change
    create_table :kinds, {id: false} do |t|
      t.column :id, "varchar(100) PRIMARY KEY"
      t.string   :name, null: false
      t.integer  :status, limit: 1, default: 1
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.decimal  :charge, precision: 9, scale: 2, null: false
      t.decimal  :puc, precision: 9, scale: 2, null: false

      t.string :branch, array:true, default: ["master"]
      t.string :id_from_branch, array:true, default:[]
      t.timestamps
    end
  end
end
