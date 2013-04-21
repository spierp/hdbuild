class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :project_id
      t.string :content_type
      t.float :file_size
      t.string :thumb
      t.string :project_doc

      t.timestamps
    end
  end
end
