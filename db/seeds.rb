
   Lock.create!(

  model: "c3po",
  manufacturer: "Lucas ltd."
  )
  
  Lock.create!(
    model: "r2d2",
  manufacturer: "Spielberg Ent."
  )



 
 locks = Lock.all

  10.times do
   Slot.create!(
 
  start_time: Faker::Time.between(Time.now, 2.days.from_now) 

   )
 end
 slots = Slot.all


  seller = User.new(
  email: "sales@bob.com", 
  name: "Seller"
  )
  seller.skip_confirmation!
  seller.save

  u = User.new(
  email: "wolf@cnn.com",
  name: "Buyer"
   )
  u.skip_confirmation!
  u.save


 Appointment.create(
  user: seller,
  slot: slots.sample
  )

 10.times do
   Property.create!(

  lock: locks.sample,
  slots: [slots.sample, slots.sample],
  user: seller,
  structure: Faker::Base.name,
  description: Faker::Company.bs,
  address: "#{Faker::Address.building_number} #{Faker::Address.street_name}",
  city: Faker::Address.city,
  state: Faker::Address.state,
  zip: Faker::Address.zip_code
   )
 end
 property = Property.all
 
 
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
