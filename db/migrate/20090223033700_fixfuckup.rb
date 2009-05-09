class Fixfuckup < ActiveRecord::Migration
  def self.up
    remove_column :questions, :hunt
    remove_column :hunts, :hunt_id
    add_column :questions, :hunt_id, :integer
  end

  def self.down
    remove_column :questions, :hunt_id
  end
end
