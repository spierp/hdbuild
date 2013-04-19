class ChangeDatesToStrings < ActiveRecord::Migration
  def up
    remove_column :projects, :submit_contract_amount
    remove_column :projects, :contract_award            
    remove_column :projects, :construction_start
    remove_column :projects, :construction_finish
        
    add_column :projects, :submit_contract_amount, :string
    add_column :projects, :contract_award, :string                
    add_column :projects, :construction_start, :string
    add_column :projects, :construction_finish, :string
  end

  def down
    remove_column :projects, :submit_contract_amount
    remove_column :projects, :contract_award            
    remove_column :projects, :construction_start
    remove_column :projects, :construction_finish
        
    add_column :projects, :submit_contract_amount, :datetime
    add_column :projects, :contract_award, :datetime                
    add_column :projects, :construction_start, :datetime
    add_column :projects, :construction_finish, :datetime
  end
end
