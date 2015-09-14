  desc ''
  task :create_slots => :environment do
    start = Time.now.in_time_zone.beginning_of_week + 9.hours
      Property.all.each do |p|
        7.times.each do |d|
          current_day = start + d.days
          12.times.each do |hour|
            p.slots.create(start_time: current_day + hour.hours)
          end 
        end
      end
  end



  

