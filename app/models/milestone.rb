class Milestone < ActiveRecord::Base
  attr_accessible :date, :name, :project_id
  
  belongs_to :project
  
end
