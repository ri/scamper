class AddXyAndLocationToQuestion < ActiveRecord::Migration
  def self.up
    add_column :questions, :x, :decimal 
    add_column :questions, :y, :decimal
    add_column :questions, :location, :string
  end

  def self.down
    remove_column :questions, :x
    remove_column :questions, :y
    remove_column :questions, :location
    
  end
end
