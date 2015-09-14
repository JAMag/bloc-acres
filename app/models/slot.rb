class Slot < ActiveRecord::Base
  extend SimpleCalendar
  has_calendar
  belongs_to :property
 # has_many :start_time
  has_one :appointment


  def starts_at
    start_time
  end

  scope :for_day, ->(day) {
      where('start_time BETWEEN ? and ?', Date.parse(day).beginning_of_day, Date.parse(day).end_of_day)
  }


end
