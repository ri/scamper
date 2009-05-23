class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table "responses", :force => true do |t|
      t.integer "question_id"
      t.integer "user_id"
      t.integer "answer_id"
    end
  end

  def self.down
    drop_table "responses"
    
  end
end
