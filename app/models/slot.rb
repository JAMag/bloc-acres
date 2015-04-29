class Slot < ActiveRecord::Base
  belongs_to :property
 # has_many :start_time
  has_one :appointment
end
