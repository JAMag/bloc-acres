class Property < ActiveRecord::Base
  belongs_to :user
  has_one :lock
#  has_one :type
#  has_one :description
#  has_one :address
#  has_one :city
#  has_one :state
#  has_one :zip
  has_many :slots


end
