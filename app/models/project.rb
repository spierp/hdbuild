class Project < ActiveRecord::Base
  attr_accessible :address, :name, :owner_id, :project_number
end
