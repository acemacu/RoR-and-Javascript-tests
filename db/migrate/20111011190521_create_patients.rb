class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|
      t.integer :numberOfTag
      t.string :color
      t.integer :age
      t.string :ageType
      t.text :complaint
      t.string :status
      t.string :ambulance
      t.string :destination

      t.timestamps
    end
  end

  def self.down
    drop_table :patients
  end
end
