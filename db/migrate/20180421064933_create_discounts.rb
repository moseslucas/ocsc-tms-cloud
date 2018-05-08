class CreateDiscounts < ActiveRecord::Migration[5.1]
  def change
    create_table :discounts, {id: false} do |t|
      t.column :id, "varchar(100) PRIMARY KEY"
      t.string :name, null:false, unique:true
      t.text :description
      t.string :discount_type
      t.decimal :amount, precision:9, scale:2
      t.integer :status, limit:1, default:1

      t.string :branch, array:true, default: ["master"]
      t.string :id_from_branch, array:true, default:[]

      t.timestamps
    end
  end
end
