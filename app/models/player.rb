class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :hunt
  has_many :responses
  validates_uniqueness_of :user_id, :scope => :hunt_id
end
