class AddScheduleStuffToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :location, :string
    add_column :projects, :description, :text
    add_column :projects, :issue_bid_docs, :datetime
    add_column :projects, :submit_contract_amount, :datetime
    add_column :projects, :contract_award, :datetime                
    add_column :projects, :construction_start, :datetime
    add_column :projects, :construction_finish, :datetime                 
  end
end
