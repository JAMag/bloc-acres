  desc 'school_districts api call'
  task :get_school_districts => :environment do


    response = HTTParty.get("https://api.census.gov/data/2017/acs/acsse?get=NAME,K200001_001E&for=school%20district%20(unified):*&key={key}&in=state:*")
    Rails.logger.info response.inspect
    resp = response.parsed_response
    resp.each do |e|
      SchoolDistrict.create(name: e[0], special_id: e[1], special_id2: e[2], zip: e[3])
    end

  end


#   remove api key



