class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :answer
  belongs_to :player

  validates_presence_of :question_id, :answer_id, :player_id

  validate :validates_only_one_answer_per_question_per_player
  before_save :cache_answer_details
  
  def question
    self[:question] ||= answer.question
  end
  
  private  
    def cache_answer_details
      self.correct     = answer.correct?
      self.question_id = question.id
 
      # need to return true so that it doesn't halt the save
      true
    end
    
    def validates_only_one_answer_per_question_per_player
      unless existing_answer_count == 0
        errors.add(:answer_id)
      end
    end
    
    def existing_answer_count
      Response.count(:conditions => {:player_id => player_id, :'answers.question_id' => answer.question_id}, :include => :answer)
    end
end
