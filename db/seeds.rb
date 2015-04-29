 10.times do
   Property.create!(

  lock: Faker::Base.between(from = 1.00, to = 500.00),
  type: Faker::Base.name,
  description: Faker::Base.bs,
  address: Faker::Base.building_number.street_name,
  city: Faker::Base.city,
  state: Faker::Base.state,
  zip: Faker::Base.zip_code,
  slots: Faker::Base.between(from = 1.00, to = 12.00)
   )
 end
 property = Property.all
 
 # Create Comments
 15.times do
   Appointment.create!(
     slots: 

   )
 end
 
 puts "Seed finished"
 puts "#{Property.count} properties created"
 puts "#{Appointment.count} appointments created"


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
