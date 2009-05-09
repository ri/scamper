class AddCreatorToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :creator, :boolean
  end

  def self.down
    remove_column :users, :creator
  end
end
