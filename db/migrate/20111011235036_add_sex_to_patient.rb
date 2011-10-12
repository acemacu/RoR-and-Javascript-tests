class AddSexToPatient < ActiveRecord::Migration
  def self.up
    add_column :patients, :sex, :string
  end

  def self.down
    remove_column :patients, :sex
  end
end
