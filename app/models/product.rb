class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates_integrity_of  :image
  validates_processing_of :image
end
