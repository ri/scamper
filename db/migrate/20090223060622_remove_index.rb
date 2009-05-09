class RemoveIndex < ActiveRecord::Migration
  def self.up
      remove_column :questions, :index
  end

  def self.down
  end
end
