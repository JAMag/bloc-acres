class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :slot
  mount_uploader :avatar, AvatarUploader, file_name: -> { 'appnt_pic' }

#  has_many :started_at
#  has_many :ended_at




end
