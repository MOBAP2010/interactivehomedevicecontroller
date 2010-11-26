class CreateDevices < ActiveRecord::Migration
  def self.up
    create_table :devices do |t|
      t.string :name
      t.string :location
      t.string :device_type
      t.boolean :power, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :devices
  end
end
