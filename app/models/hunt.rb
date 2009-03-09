class Hunt < ActiveRecord::Base
  has_many :questions
  has_many :players
  has_many :users, :through => :players
  validates_presence_of :name
  

end
