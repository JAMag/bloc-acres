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
  has_many :products
  has_many :connections, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :store_purchases


  validates_integrity_of  :avatar
  validates_processing_of :avatar

  # social media marketer
  validates_presence_of :time_zone
  # end of social media marketer


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

def facebook
  self.connections.where(provider: 'facebook').first
end

def twitter
  self.connections.where(provider: 'twitter').first
end

  
end
