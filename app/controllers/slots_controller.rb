class SlotsController < ApplicationController
  #before_filter :set_time_zone, if: :user_signed_in?
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


  def destroy
    @slot = current_user.properties.find(params[:property_id]).slots.find(params[:id])

    authorize = @slot
    if @slot.destroy
      flash[:notice] = "Removed showing period."
      redirect_to dashboard_path
    else
      flash[:error] = "Showing period not removed. Try again."
      redirect_to dashboard_path
    end
  end

  def by_day
    @slots = current_user.properties.find(params[:property_id]).slots.for_day(params[:day])

    authorize = @slots
    if @slots.destroy_all
      flash[:notice] = "Day removed."
      redirect_to dashboard_path
    else
      flash[:error] = "Day not removed. Try again."
      redirect_to dashboard_path
    end
  end

end

