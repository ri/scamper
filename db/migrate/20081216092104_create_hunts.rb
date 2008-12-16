class CreateHunts < ActiveRecord::Migration
  def self.up
    create_table :hunts do |t|
      t.string :id
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :hunts
  end
end
