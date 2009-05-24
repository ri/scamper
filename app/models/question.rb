class Question < ActiveRecord::Base
  belongs_to :hunt
  belongs_to :correct_answer, :class_name => "Answer"
  
  has_many :hints
  has_many :answers
  
  has_many :responses, :through => :answers
  
  accepts_nested_attributes_for :answers, :allow_destroy => true
end
