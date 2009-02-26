class Question < ActiveRecord::Base
  belongs_to :hunt, :foreign_key => "hunt_id"
  
  

  
  
end
