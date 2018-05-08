class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients, {id: false} do |t|
      t.column :id, "varchar(100) PRIMARY KEY"
      t.string :name, null:false
      t.string :description
      t.string :address
      t.string :contact, limit:30
      t.string :email
      t.decimal :credit_limit, precision: 9, scale: 2, default: "0.0"
      t.string :discount_id
      t.integer :status, limit:1, default:1, null:false

      t.string :branch, array:true, default: ["master"]
      t.string :id_from_branch, array:true, default:[]

      t.timestamps
    end
  end
end
