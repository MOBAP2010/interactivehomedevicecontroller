class Option < ActiveRecord::Base

  belongs_to :device

  validates_presence_of :name

end
