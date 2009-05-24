class Response < ActiveRecord::Base
  belongs_to :answer
  belongs_to :player
  
  before_create :cache_correctness

  delegate :question, :to => :answer
  validates_uniqueness_of :question, :scope => :player_id
  
  private  
    def cache_correctness
      self.correct = answer.correct?
 
      # need to return true so that it doesn't halt the save
      true
    end
end