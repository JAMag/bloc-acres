class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :slot
  mount_base64_uploader :avatar, ImageUploader

#  has_many :started_at
#  has_many :ended_at




end
