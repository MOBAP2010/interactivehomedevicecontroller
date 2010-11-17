class Device < ActiveRecord::Base

  has_many :options, :dependent => :destroy
  accepts_nested_attributes_for :options
  has_one :type

  validates_presence_of :name

  def to_json
    options[:only] = [:id, :name, :location, :power, :type]
    super(options)
  end
end
