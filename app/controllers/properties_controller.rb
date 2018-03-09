class PropertiesController < ApplicationController
  helper_method :sort_column, :sort_direction
  require 'will_paginate/array'


  def index
    # price: params[:search][:price]
# with: price_range,
    # price_range = {
    #   :price => (params[:search][:min_price]..params[:search][:max_price])
    #
    # }
    # :price => (params[:min_price].to_s.to_i..params[:max_price].to_s.to_i).to_a
    if params[:search]

      @properties = Property.search(params[:search][:full_search], conditions: {
                                        structure: params[:search][:structure],
                                        beds: params[:search][:beds],
                                        baths: params[:search][:baths],
                                        price: params[:search][:price]
                                    },
                                    order: sort_info
      ).paginate(page: params[:page], per_page: 5)
    else
      @properties = Property.all.paginate(page: params[:page], per_page: 5).order(sort_column + " " + sort_direction)
    end
    gon.property_coordinates = @properties.map{|p|{lat: p.latitude, lng: p.longitude}}

  end


  def saved_search
    current_user.update_attribute(:saved_search, params.to_query)
    redirect_to :back
  end


  def show
    @property = Property.friendly.find(params[:id])
    @slots = @property.slots.future
    #@addOffer= @property.addoffer
    # @comments = Comment.where(property_id: @property).order("created_at DESC")


    @has_slots = @property.slots.future.map{|slot| slot.start_time.strftime('%y%m%d-%I%P')}

    @booked_appointments = @property.appointments.map(&:slot).map{|slot| slot.start_time.strftime('%y%m%d-%I%P')}



#     reconfigure of db and timepicker for appointment booking

    @slot_info = {}
    @slots.each do |slot|
      formatted_date = slot.start_time.strftime('%y%m%d-%I%P')
      key = formatted_date
      value = {
          id: slot.id,
          is_booked: @booked_appointments.include?(formatted_date)
      }

      @slot_info[key] = value
    end

logger.info " SLOTS #{@property.appointments.map(&:slot).inspect}"
    gon.push({booked_appointments: @booked_appointments})
    gon.push({has_slots: @has_slots})
    gon.push({property: @property})
    gon.push({slots: @slots})
    gon.push({slot_info: @slot_info})

    #pdf generation
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "#{@property.address}",
               :layout => "pdf",
               :template => 'properties/show.pdf.erb',
               :page_size => "A4",
               :show_as_html => params[:debug].present?
      end
    end
  end

  def edit
    @property = Property.friendly.find(params[:id])
    authorize @property
  end

  def update
    @property = Property.friendly.find(params[:id])
    if @property.update_attributes(property_params)
      flash[:notice] = 'Edited listing.'
      redirect_to @property
    else
      flash[:error] = 'Error updating listing. Try again.'
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
      flash[:notice] = 'Created listing.'
      redirect_to @property
    else
      flash[:error] = 'Error creating listing. Try again.'
      redirect_to edit_property_path(@property)
    end
  end


  def destroy
    @property = current_user.properties.friendly.find(params[:id])

    authorize = @property
    if @property.destroy
      flash[:notice] = 'Listing removed.'
      redirect_to dashboard_path
    else
      flash[:error] = 'Listing not removed. Try again.'
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

  def sort_column
   Property.column_names.include?(params[:sort]) ? params[:sort] : "price"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def sort_info
    "#{sort_column} #{sort_direction}"
  end
end