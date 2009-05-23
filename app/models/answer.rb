class Answer < ActiveRecord::Base
  belongs_to :question, :foreign_key => "id"
  
  def to_s
    text
  end
end
