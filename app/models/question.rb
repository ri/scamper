class Question < ActiveRecord::Base
  belongs_to :hunt
  belongs_to :correct_answer, :class_name => "Answer"
  
  has_many :hints
  has_many :answers
  
  has_many :responses, :through => :answers
  
  accepts_nested_attributes_for :answers, :allow_destroy => true
  accepts_nested_attributes_for :hints, :allow_destroy => true
  
  validates_presence_of :location, :question, :hunt_id, :correct_answer
  
  named_scope :not_answered, lambda {|player| {:conditions =>['id NOT IN (SELECT DISTINCT question_id FROM responses WHERE player_id = ?)', player.id] }}
  
  def answered?(user)
    0 != begin
      player_id = Player.find_by_user_id_and_hunt_id(user.id, hunt_id).id
      Response.count(:conditions => {:'responses.player_id' => player_id, :'answers.question_id' => id}, :include => :answer)
    end
  rescue
    false
  end
  
end
