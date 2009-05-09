class AddMissingHuntFields < ActiveRecord::Migration
  def self.up
    add_column :hunts, :subject, :string
    add_column :hunts, :schoolname, :string
    
  end

  def self.down
    remove_column :hunts, :subject
    remove_column :hunts, :schoolname
  end
end
