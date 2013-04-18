class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :address
      t.string :project_number
      t.integer :owner_id

      t.timestamps
    end
  end
end
