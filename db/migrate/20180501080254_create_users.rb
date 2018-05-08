class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users , {id:false} do |t|
      t.column :id, "VARCHAR(30) PRIMARY KEY"
      t.string :name, unique:true
      t.string :password_digest
      t.string :user_type, default:"user"
      t.string :status, limit:1, default:1
      #index
      t.index ["name"], name: "index_users_on_name", unique: true, using: :btree

      t.timestamps
    end
  end
end
