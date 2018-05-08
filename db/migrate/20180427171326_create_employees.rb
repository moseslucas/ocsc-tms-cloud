class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees, {id: false} do |t|
      t.column :id, "varchar(100) PRIMARY KEY"
      t.string :name, limit: 100
      t.string :position, limit: 100
      t.string :department, limit: 100, null:true
      t.string :contact, limit: 50
      t.string :email, limit: 30
      t.integer :status, limit: 1, default:1

      t.string :branch, array:true, default: ["master"]
      t.string :id_from_branch, array:true, default:[]

      t.timestamps
    end
  end
end
