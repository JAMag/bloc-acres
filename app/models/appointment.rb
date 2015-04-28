class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :slot
  has_many :started_at
  has_many :ended_at


end
