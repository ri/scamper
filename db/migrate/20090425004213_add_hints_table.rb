class AddHintsTable < ActiveRecord::Migration
  def self.up
    create_table :hints do |t|
      t.integer :question_id
      t.integer :hint
    end
  end

  def self.down
  end
end
