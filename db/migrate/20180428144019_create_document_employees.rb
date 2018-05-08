class CreateDocumentEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :document_employees, {id:false} do |t|
      t.column :id, "VARCHAR(30) PRIMARY KEY"
      t.string :document_id, limit: 30, null:false
      t.string :employee_id, limit: 30, null:false
      t.string :description, null:true
      t.integer :status, limit:1, default:1

      t.string :branch, array:true, default: ["master"]
      t.string :id_from_branch, array:true, default:[]

      t.timestamps
    end
  end
end
