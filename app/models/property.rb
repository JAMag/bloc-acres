class Property < ActiveRecord::Base

  extend FriendlyId
  friendly_id :map_address, use: :slugged
 


  belongs_to :user
  has_one :lock, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :slots, dependent: :destroy
  has_many :appointments, -> { order('created_at DESC') }, through: 'slots'
  has_many :add_offers
  has_many :comments

  mount_uploaders :photos, PhotoUploader

  geocoded_by :map_address   # can also be an IP address
  before_save :geocode          # auto-fetch coordinates



  def map_address
    "#{address} #{city} #{state} #{zip}"
  end

  def lat_long_for_map

  end

  def booked_by_user?(user)
    s = slots.select { |s| s.appointment && s.appointment.user == user}
    s.empty? ? nil : s.first

  end


  def monthly_payment
    (((price.to_i)*(0.06 / 12)) / (1-(1+ 0.06 / 12)**(360 * -1))).round
  end




  
end
