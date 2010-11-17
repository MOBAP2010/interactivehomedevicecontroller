class AddPowerToDevice < ActiveRecord::Migration
  def self.up
    add_column :devices, :power, :boolean
  end

  def self.down
    remove_column :devices, :power
  end
end
