class AddExtrasToHunt < ActiveRecord::Migration
  def self.up
    add_column :hunts, :location, :text
    add_column :hunts, :start, :datetime
    add_column :hunts, :end, :datetime
  end

  def self.down
    remove_column :hunts, :end
    remove_column :hunts, :start
    remove_column :hunts, :location
  end
end
