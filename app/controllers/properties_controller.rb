class PropertiesController < ApplicationController
  def index
    if params[:search]
      @properties = Property.search(params[:search][:full_search], conditions: {
                                        structure: params[:search][:structure],
                                        beds: params[:search][:beds],
                                        baths: params[:search][:baths],
                                        price: params[:search][:price]
                                    }
      )
    else
      @properties = Property.all
    end
    gon.property_coordinates = @properties.map{|p|{lat: p.latitude, lng: p.longitude}}

  end



  def show
    @property = Property.find(params[:id])
    @slots = @property.slots.future
    #@addOffer= @property.addoffer
    @comments = Comment.where(property_id: @property).order("created_at DESC")


    @has_slots = @property.slots.future.map{|slot| slot.start_time.strftime('%y%m%d-%I%P')}

    @booked_appointments = @property.appointments.map(&:slot).map{|slot| slot.start_time.strftime('%y%m%d-%I%P')}
logger.info " SLOTS #{@property.appointments.map(&:slot).inspect}"
    gon.push({booked_appointments: @booked_appointments})
    gon.push({has_slots: @has_slots})
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
      flash[:error] = "Error updating listing. Try again."
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
    @property = current_user.properties.find(params[:id])

    authorize = @property
    if @property.destroy
      flash[:notice] = "Listing removed."
      redirect_to dashboard_path
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
    params.require(:property).permit(:structure, :address, :city, :state, :zip, :description, :baths, :beds, :sqft, :lot, :price, :lock, :showcase, {photos: []})
  end
end