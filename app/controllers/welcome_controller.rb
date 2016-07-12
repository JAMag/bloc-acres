class WelcomeController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about]

  def name
    @property = Property.find(params[:id])
    @name = @property.user.name
  end

  def index
  end

  def about
  end


  def dashboard
    @properties = current_user.properties
    @appointments = current_user.appointments
    @favorites = current_user.favorites

    if current_user.buyer?
      render :buyer_dashboard
    else
      render :seller_dashboard
    end
  end


end
