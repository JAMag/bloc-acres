class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :slot
  mount_base64_uploader  :avatar, AvatarUploader, file_name: -> { 'appnt_pic' }
#  has_many :started_at
#  has_many :ended_at


# this method will be called during standard assignment in your controller
# (like `update_attributes`)
  def image_data=(data)
    # decode data and create stream on them
    io = CarrierStringIO.new(Base64.decode64(data))

    # this will do the thing (photo is mounted carrierwave uploader)
    self.photo = io
  end

end
