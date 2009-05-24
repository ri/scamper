class Question < ActiveRecord::Base
  belongs_to :hunt
  belongs_to :correct_answer, :class_name => "Answer"
  
  has_many :hints
  has_many :answers
  
  has_many :responses, :through => :answers
  
  accepts_nested_attributes_for :answers, :allow_destroy => true
  validates_presence_of :location, :message => "^Please select a location"
  validates_presence_of :question, :hunt_id, :correct_answer_id
  
  
  
  def answered?(user)
    player_id = Player.find_by_user_id_and_hunt_id(user.id, hunt_id).id
    Response.count(:conditions => {:player_id => player_id, :'answers.question_id' => id}, :include => :answer)
  rescue
    false
  end
end
