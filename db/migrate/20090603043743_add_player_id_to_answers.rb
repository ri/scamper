class AddPlayerIdToAnswers < ActiveRecord::Migration
  def self.up
    add_column :answers, :player_id, :integer
  end

  def self.down
    remove_column :answer, :player_id
  end
end
