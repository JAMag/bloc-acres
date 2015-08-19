class Property < ActiveRecord::Base
  belongs_to :user
  has_one :lock
#  has_one :type
#  has_one :description
#  has_one :address
#  has_one :city
#  has_one :state
#  has_one :zip
  has_many :favorites
  has_many :slots
  mount_uploader :photo, PhotoUploader

  def map_address
    "#{address} #{city} #{state} #{zip}"
  end

  def booked_by_user?(user)
    s = slots.select { |s| s.appointment && s.appointment.user == user}
    s.empty? ? nil : s.first
  end
  
end
