class Comment < ActiveRecord::Base
  ratyrate_rateable "quality"
  belongs_to :property
  belongs_to :user

end
