require 'httparty'
class Lock < ActiveRecord::Base
  belongs_to :property
#  has_one :model
#  has_one :manufacturer


  def unlock
    if check_time_and_location(property.slots)
      response = HTTParty.put("https://api.lockitron.com/v2/locks/#{lockitron_id}?state=unlock&access_token=2efb44aeffec446949c7554cf7a7367a7f3a5e402ddbf8bad86c1b16c3ff1990")
      Rails.logger.info response.inspect
      resp = JSON.parse(response.body)
      "Lock #{resp['name']} is now #{resp['state']}ed"
    else
      "error"
    end
  end

  def lock
    response = HTTParty.put("https://api.lockitron.com/v2/locks/#{lockitron_id}?state=lock&access_token=2efb44aeffec446949c7554cf7a7367a7f3a5e402ddbf8bad86c1b16c3ff1990")
    Rails.logger.info response.inspect
    resp = response.parsed_response
    "Lock #{resp['name']} is now #{resp['state']}ed"

  end




end
