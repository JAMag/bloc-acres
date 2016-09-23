class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :properties
  has_many :appointments
  has_many :favorites
  has_many :add_offers
  has_many :comments


  validates_integrity_of  :avatar
  validates_processing_of :avatar

def admin?
  role == 'admin'
end

def buyer?
  role == 'buyer'
end

def seller?
  role == 'seller'
end

def favorited(property)
  favorites.where(property_id: property.id).first
end

  
end
