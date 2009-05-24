class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table "responses", :force => true do |t|
      t.integer "player_id"
      t.integer "answer_id"
      t.boolean "correct"
    end
  end

  def self.down
    drop_table "responses"
    
  end
end
