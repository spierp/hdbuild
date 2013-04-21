class ChangeCateogryToCategory < ActiveRecord::Migration
  def up
    remove_column :documents, :document_cateogry
    add_column :documents, :document_category, :string
  end

  def down
    remove_column :documents, :document_category
    add_column :documents, :document_cateogry, :string    
  end
end
