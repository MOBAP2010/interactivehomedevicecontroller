class Device < ActiveRecord::Base

  has_many :options, :dependent => :destroy
  accepts_nested_attributes_for :options

  validates_presence_of :name

end
