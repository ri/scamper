class Fix < ActiveRecord::Migration
  def self.up
    remove_column :hints, :hint
    add_column :hints, :hint, :string
end

  def self.down
  end
end