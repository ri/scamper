class AddNamesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :organisation, :string
    add_column :users, :creator, :boolean
    remove_column :users, :name
  end

  def self.down
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :organisation
    remove_column :users, :creator
    add_column :users, :name, :string
  end
end
