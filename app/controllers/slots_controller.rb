class SlotsController < ApplicationController
  def index
    @slots = Slots.all
  end

  def show
    @slot = Slot.find(params[:id])
    @property = @slot.property
  end

  def new
    @slot = Slot.new
  end

end


#private
#  def property_params
#     params.require(:slot).permit(:start_time)
#  end
#end