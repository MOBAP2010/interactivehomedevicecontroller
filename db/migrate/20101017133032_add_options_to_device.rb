class AddOptionsToDevice < ActiveRecord::Migration
  def self.up
    add_column :options,:device_id, :integer
  end

  def self.down
    remove_column :options, :device_id
  end
end
