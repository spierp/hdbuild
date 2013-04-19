class Membership < ActiveRecord::Base
  attr_accessible :project_id, :role, :user_id
  
  belongs_to :user
  belongs_to :project
  
end
