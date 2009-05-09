class ChangeAnswerToString < ActiveRecord::Migration
  def self.up
    remove_column :questions, :answer
    add_column :questions, :answer, :string
  end

  def self.down
    remove_column :questions, :answer
  end
end
