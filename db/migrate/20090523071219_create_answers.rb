class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table "answers", :force => true do |t|
      t.integer  "question_id"
      t.string   "option"
      t.boolean  "correct"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def self.down
    drop_table "answers"
  end
end
