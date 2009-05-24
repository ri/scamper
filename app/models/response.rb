class Response < ActiveRecord::Base
  belongs_to :answer
  belongs_to :player

  validate :validates_only_one_answer_per_question_per_player
  before_create :cache_correctness

  delegate :question, :to => :answer
  
  private  
    def cache_correctness
      self.correct = answer.correct?
 
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