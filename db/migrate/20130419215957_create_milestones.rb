class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.integer :project_id
      t.string :name
      t.date :date

      t.timestamps
    end
  end
end
