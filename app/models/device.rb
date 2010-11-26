class Device < ActiveRecord::Base

  validates_presence_of :name, :location, :device_type

  def to_json
    options[:only] = [:id, :name, :location, :power, :type]
    super(options)
  end
end
