class AddAnswerToAnswers < ActiveRecord::Migration
  def self.up
    add_column :answers, :text, :string
  end

  def self.down
    remove_column :answers, :text
  end
end
