class Property < ActiveRecord::Base
  belongs_to :user
  has_one :lock, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :slots, dependent: :destroy
  has_many :add_offers
  has_many :comments
  mount_uploaders :photos, PhotoUploader

  def map_address
    "#{address} #{city} #{state} #{zip}"
  end

  def booked_by_user?(user)
    s = slots.select { |s| s.appointment && s.appointment.user == user}
    s.empty? ? nil : s.first
  end

def add_offer
  @add_offer = Property.Add_Offer[params: id]
end



  
end
