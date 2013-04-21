class Add < ActiveRecord::Migration
  def up
    add_column :documents, :document_cateogry, :string
  end

  def down
    remove_column :documents, :document_cateogry  
  end
end
