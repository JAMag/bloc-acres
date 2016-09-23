class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :properties
  has_many :appointments
  has_many :favorites
  has_many :add_offers
  has_many :comments

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
