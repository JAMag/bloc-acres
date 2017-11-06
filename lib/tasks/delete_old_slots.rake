namespace :delete do
  desc 'Delete unused slot records older than 60 days'
  task :old_records => :environment do
    Slot.where('created_at < ?', 60.days.ago).each do |model|
      unless Appointment.find_by(slot_id: model.id)
        model.destroy
        # puts " deleted #{model.id}"
      else
        # puts "Not deleted because of appointment #{model.id}"
      end
    end

    # or Model.delete_all('created_at < ?', 60.days.ago) if you don't need callbacks
  end
end