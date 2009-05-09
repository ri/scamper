class AddCreatedByToHunts < ActiveRecord::Migration
  def self.up
    add_column :hunts, :created_by, :string
  end

  def self.down
    remove_column :hunts, :created_by
  end
end
