class Lock < ActiveRecord::Base
  belongs_to :property
  has_one :model
  has_one :manufacturer
end
