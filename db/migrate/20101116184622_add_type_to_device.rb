class AddTypeToDevice < ActiveRecord::Migration
  def self.up
    add_column :devices, :type_id, :integer
  end

  def self.down
    remove_column :devices, :type_id
  end
end
