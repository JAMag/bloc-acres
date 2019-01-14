class Advertisement < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  ratyrate_rateable "vouch"


end
