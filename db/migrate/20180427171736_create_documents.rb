class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents, {id: false} do |t|
      t.column :id, "varchar(100) PRIMARY KEY"
      t.string   :ref_id, limit: 30
      t.string   :client_id, limit: 30
      t.string   :kind_id, limit: 30
      t.string   :discount_id, limit: 30
      t.string   :calculation_id, limit: 30
      t.string   :source_id, limit: 30
      t.string   :destination_id, limit: 30, null: false
      t.date     :trans_date
      t.string   :description
      t.string   :doc_type, default: "rec", null: false
      t.integer  :status1, limit: 1, default: 1
      t.integer  :status2, limit: 1, default: 1
      t.string   :origin_id, limit: 30
      t.decimal  :total_amount, precision: 9, scale: 2
      t.string   :shipper
      t.string   :released_to
      t.date     :released_date
      t.text     :custom_tag, limit: 65535

      t.string :branch, array:true, default: ["master"]
      t.string :id_from_branch, array:true, default:[]

      t.timestamps
    end
  end
end
