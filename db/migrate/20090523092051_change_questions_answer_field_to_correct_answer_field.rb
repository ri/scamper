class ChangeQuestionsAnswerFieldToCorrectAnswerField < ActiveRecord::Migration
  def self.up
    change_column :questions, :answer, :integer
    rename_column :questions, :answer, :correct_answer_id
  end

  def self.down
    rename_column :questions, :correct_answer_id, :answer
      change_column :questions, :answer, :string
  end
end
