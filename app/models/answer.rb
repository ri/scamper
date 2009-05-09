class Answer < ActiveRecord::Base
  belongs_to :question, :foreign_key => "id"
end
