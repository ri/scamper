class CreateHints < ActiveRecord::Migration
  def self.up
    create_table "hints", :force => true do |t|
      t.integer "question_id"
      t.string  "hint"
    end
  end

  def self.down
    drop_table "hints"
  end
end
