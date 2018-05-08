class CreateDocumentDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :document_details, {id: false} do |t|
      t.column :id, "varchar(100) PRIMARY KEY"
      t.string   :document_shipping_id, limit: 30
      t.string   :document_id, limit: 30, null: false
      t.string   :description
      t.integer  :qty
      t.decimal  :price, precision: 9,  scale: 2
      t.integer  :status, limit: 1, default: 1, null: false
      t.decimal  :declared_value, precision: 9,  scale: 2
      t.decimal  :weight, precision: 10
      t.integer  :tags
      t.string   :uom

      t.string :branch, array:true, default: ["master"]
      t.string :id_from_branch, array:true, default:[]
      t.timestamps
    end
  end
end
