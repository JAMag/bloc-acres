class WelcomeController < ApplicationController
before_action :authenticate_user!, except: [:index, :about]


  def index
  end

  def about
  end


  def dashboard
    @properties = current_user.properties
    @appointments = current_user.appointments
  end
end
