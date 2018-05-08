class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments, {id: false} do |t|
      t.column :id, "varchar(100) PRIMARY KEY"
      t.string   :document_id,  limit: 30, null: false
      t.string   :ref_id,       limit: 50
      t.date     :trans_date, null: false
      t.string   :description
      t.decimal  :amount, precision: 9, scale: 2, null: false
      t.string   :payment_type, limit: 50, default: "cash"
      t.string   :employee_id,  limit: 30
      t.integer  :status, limit: 1, default: 1
      t.date     :deposit_date
      t.index ["id"], name: "index_id_on_payments", unique: true, using: :btree

      t.string :branch, array:true, default: ["master"]
      t.string :id_from_branch, array:true, default:[]

      t.timestamps
    end
  end
end
