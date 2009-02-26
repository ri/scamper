class Hunt < ActiveRecord::Base
  has_many :questions
  validates_presence_of :name
  

end
