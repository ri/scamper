class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :responses
  
  def to_s
    text
  end
  
  def correct?
    question.correct_answer == self
  end
end
