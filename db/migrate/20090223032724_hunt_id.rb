class HuntId < ActiveRecord::Migration
  def self.up
    remove_column :questions, :hunt
    add_column :questions, :hunt_id, :integer
  end

  def self.down
    remove_column :questions, :hunt_id
  end
end
