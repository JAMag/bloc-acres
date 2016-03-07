class LocksController < ApplicationController
  def index
  end

  def show
    @lock = Lock.find(params[:id])
  end

  def new
  end

  def edit
  end

  def unlock
    @lock = Lock.find(params[:id])
    response = @lock.unlock(slot)


    redirect_to lock_path(@lock), notice: response
  end

  def lock
    @lock = Lock.find(params[:id])
    response = @lock.lock


    redirect_to lock_path(@lock), notice: response
  end

end
