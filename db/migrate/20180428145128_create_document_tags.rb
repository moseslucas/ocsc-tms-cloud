class CreateDocumentTags < ActiveRecord::Migration[5.1]
  def change
    create_table :document_tags, {id: false} do |t|
      t.column :id, "varchar(100) PRIMARY KEY"
      t.string   :description, null: false
      t.string   :document_detail_id, limit: 30, null: false
      t.index ["id"], name: "index_documnet_tags_on_id", unique: true, using: :btree

      t.string :branch, array:true, default: ["master"]
      t.string :id_from_branch, array:true, default:[]

      t.timestamps
    end
  end
end
