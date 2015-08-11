class PropertiesController < ApplicationController
  def index
    @properties = Property.search(params[:search])
  end

  def show
    @property = Property.find(params[:id])
    @slots = @property.slots
  end

  def edit
    @property = Property.find(params[:id])
    authorize @property
  end

  def update
    @property = Property.find(params[:id])
    if @property.update_attributes(property_params)
      flash[:notice] = "Edited listing."
      redirect_to @property
    else
      flash[:error] = "Error creating listing. Try again."
      redirect_to edit_property_path(@property)
    end
  end

  def about
  end


  def new
   @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    #@slot = @property.slot
    authorize @property
    if @property.save
      flash[:notice] = "Created listing."
      redirect_to @property
    else
      flash[:error] = "Error creating listing. Try again."
      redirect_to edit_property_path(@property)
    end
  end



  def destroy
    @property = current_user.property

    authorize = @property
    if @property.destroy
    flash[:notice] = "Listing removed."
    redirect_to [@property]
    else
    flash[:error] = "Listing not removed. Try again."
    redirect_to [@property]
    end
  end

  def dashboard
    @properties = current_user.properties
    @appointments = current_user.appointments
  end

  private
  def property_params
     params.require(:property).permit(:structure, :address, :city, :state, :zip, :description, :lock, :photo, :photo_cache)
  end
end