class Question < ActiveRecord::Base
  belongs_to :hunt, :foreign_key => "hunt_id"
  has_many :hints
  has_many :answers, :class_name => 'Question'
end
